#include "script_component.hpp"
/*
 * Author: dedmen
 * Retrieves all playabel units
 *
 * Arguments:
 * None
 *
 * Return Value:
 * List of units <ARRAY>
 *
 * Example:
 * [] call wolf_mission_main_fnc_getPlayableUnits
 *
 * Public: Yes
 */


all3DENEntities params ["_objects"/*, "_groups", "_triggers", "_systems", "_waypoints", "_markers", "_layers", "_comments"*/];


_objects select {(_x get3DENAttribute "ControlMP")#0}