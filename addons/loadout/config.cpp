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
