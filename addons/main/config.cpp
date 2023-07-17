#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_common"};
        author = "";
        authors[] = {"Wolf Corps"};
        authorUrl = "https://wolfcorps.de";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\ReportScreen.hpp"


class ctrlMenuStrip;
class Display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += {QGVAR(Tools)};
                };
                class GVAR(Tools) {
                    text = "Wolf Corps Mission Tools";
                    items[] = {QGVAR(RunMissionCheck)};
                };

                class GVAR(RunMissionCheck) {
                    text = "Mission Check";
                    Action = QUOTE(call wolf_mission_main_fnc_runCheck);
                };
            };
        };
    };
};