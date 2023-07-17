#include "script_component.hpp"

params ["_checkContext"];

private _unit = _checkContext get "unit";

// #TODO move to init check context
_checkContext set ["unitItems", uniqueUnitItems _unit];

// Detect unit type 
if (_unit call FUNC(isUnitMedic)) then {_checkContext set ["isMedic", true]};
if (_unit call FUNC(isUnitEOD)) then {_checkContext set ["isEOD", true]};


_checkContext call FUNC(checks_medicItems);


if (_checkContext call ["GetItemCount", "ACE_EarPlugs"] < 1) then {
	_checkContext call ["AddWarning", ["loadout", "Missing EarPlugs"]];
}

