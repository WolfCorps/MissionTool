#include "script_component.hpp"

params ["_checkContext"];

private _unit = _checkContext get "unit";

private _itemConditionMin = {
	params ["_desc", "_items", "_minCount"];

	private _actualCount = _checkContext call ["GetItemCount", _items];
	if (_actualCount < _minCount) then {
		_checkContext call ["AddWarning", ["loadout", format ["Not enough %1 (Expected %2 >= %3)", _desc, _actualCount, _minCount]]];
	};
};

if (_checkContext get "isMedic") then {

	// Medics should have injectors

	["Epinephrine", "ACE_epinephrine", 5] call _itemConditionMin;
	["Morphine", "ACE_morphine", 5] call _itemConditionMin;
	["Bandages", ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot"], 50] call _itemConditionMin;
	["Torniquet", "ACE_tourniquet", 4] call _itemConditionMin;
	["Splint", "ACE_splint", 5] call _itemConditionMin;

	// Fluid in liters
	private _fluidAmount = 
		(_checkContext call ["GetItemCount", ["ACE_bloodIV", "ACE_plasmaIV", "ACE_salineIV"]]) +
		(_checkContext call ["GetItemCount", ["ACE_bloodIV_500", "ACE_plasmaIV_500", "ACE_salineIV_500"]]) * 0.5 +
		(_checkContext call ["GetItemCount", ["ACE_bloodIV_250", "ACE_plasmaIV_250", "ACE_salineIV_250"]]) * 0.25;

	if (_fluidAmount < 5) then {
		_checkContext call ["AddWarning", ["loadout", format ["Not enough medical fluids (Expected %1L >= %2L)", _fluidAmount, 5]]];
	};

	["Surgical Kit", "ACE_surgicalKit", 1] call _itemConditionMin;
} else {
	// Non medic unit

	["Bandages", ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot"], 20] call _itemConditionMin;
	["Torniquet", "ACE_tourniquet", 1] call _itemConditionMin;


	if (_checkContext call ["GetItemCount", "ACE_surgicalKit"] > 0) then {
		_checkContext call ["AddWarning", ["loadout", format ["Unit has Surgical kit, but is not a medic"]]];
	};

};