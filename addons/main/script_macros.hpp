#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"


#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define PREP_SUB(subfolder,fncName) [QPATHTOF(functions\subfolder\DOUBLES(fnc,fncName).sqf), QUOTE(FUNC(DOUBLES(subfolder,fncName)))] call CBA_fnc_compileFunction

#define ATTRIB(unit, attrib) ((unit get3DENAttribute attrib) select 0)

#include "\z\wolf_mission\addons\main\ui\IDs.hpp"