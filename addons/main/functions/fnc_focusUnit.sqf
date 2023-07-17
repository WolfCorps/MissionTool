#include "script_component.hpp"
/*
 * Author: dedmen
 * Selects and focuses a specific unit
 *
 * Arguments:
 * 0: Unit Eden Entity <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target] call wolf_mission_main_fnc_focusUnit
 *
 * Public: Yes
 */

params ["_target"];

set3DENSelected [_target];

move3DENCamera [getPos _target, true];
//#TODO look at https://community.bistudio.com/wiki/get3DENCamera