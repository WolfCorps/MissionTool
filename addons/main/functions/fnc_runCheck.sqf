#include "script_component.hpp"


private _formatUnit = {
	params ["_checkContext"];

	private _text = [];
	private _unit = _checkContext get "unit";
	private _warnings = _checkContext get "_warnings";

	if (_warnings isEqualTo []) exitWith {_text}; // Nothing here to report

	_text pushBack format ["<t size='1.5'><a href='ftp://%1'>Unit %2 (%3)</a></t>", get3DENEntityID _unit, name _unit, _unit get3DENAttribute "description"];

	private _warningCategories = createHashMap;

	{
		private _warnArr = _warningCategories getOrDefault [_x get "ctx", [], true];
		_warnArr pushBack (_x get "text");
	} forEach _warnings;

	{
		_text pushBack format ["- <t size='1.1'>%1</t>", _x];
		{
			_text pushBack format ["  - %1", _x];
		} forEach _y;
	} forEach _warningCategories;

	_text
};


private _text = ["Results:"];

//private _units = get3DENSelected "Object"; // Selected objects
private _units = all3DENEntities select 0; // All objects 
_units = _units select {_x isKindOf "CAManBase"}; // Soldiers only 
_units = _units select {(_x get3DENAttribute "ControlMP") select 0}; // Playable units only

{
	private _checkContext = [_x] call EFUNC(loadout,createCheckContext);

	_checkContext call EFUNC(loadout,checkUnitLoadout);

	_text append (_checkContext call _formatUnit);
} forEach _units;


_text = _text joinString "<br/>";


private _displayToUse = [findDisplay 46, findDisplay 312] select (!isNull findDisplay 312);
_displayToUse = [_displayToUse, findDisplay 313] select (is3DEN); //#TODO we know we are is3DEN

_display = _displayToUse createDisplay QGVAR(ReportScreen);

private _loadoutInfoCtrl = _display displayCtrl IDC_report_textBox;
_loadoutInfoCtrl ctrlSetStructuredText parseText _text;

FUNC(OnHTMLLink) = {
	params ["_control", "_url"];
	private _idStr = _url select [6];
	private _unitId = parseNumber _idStr;

	private _unit = get3DENEntity _unitId;
	_unit call FUNC(focusUnit);
	true
};

_loadoutInfoCtrl ctrlAddEventHandler ["HTMLLink", {call FUNC(OnHTMLLink)} ];
