#include "script_component.hpp"

params ["_checkContext"];

private _warnings = [];

if (("Multiplayer" get3DENMissionAttribute "respawn") == 0) then {
	_warnings pushBack "- <t size='1.1'>Respawn is disabled</t>";
};

if (("Scenario" get3DENMissionAttribute "EnableDebugConsole") == 0) then {
	_warnings pushBack "- <t size='1.1'>Debug Console is disabled</t>";
};

if (("Scenario" get3DENMissionAttribute "SaveBinarized") != false) then {
	_warnings pushBack "- <t size='1.1'>Mission.sqm binarization is enabled (Should be off to allow for quick text editor edits)</t>";
};

_warnings