#include "RscCommon.hpp"
#include "IDs.hpp"

#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

class GVAR(ReportScreen) {
    idd = IDD_loadoutInfo;
    enableSimulation = 1;

    //onLoad = QUOTE([_this] call FUNC(onLoadoutInfoOpen));

    class controls {
        class buttonClose: ctrlButton {
            idc = -1;
            x = QUOTE(safezoneW + safezoneX - 32 * GRID_W);
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(30 * GRID_W);
            h = QUOTE(7 * GRID_H);
            sizeEx = QUOTE(5 * GRID_H);
            text = "Close";
            shortcuts[]= {"0x01"};
            tooltip= "";
            onButtonClick = QUOTE(ctrlParent (_this select 0) closeDisplay 2);
        };

        class myControl: RscControlsGroup {
            x = QUOTE(safezoneX + (70 * GRID_W));
            y = QUOTE(safezoneY + (12 * GRID_H));
            w = QUOTE(200 * GRID_W);
            h = QUOTE(safezoneH - (34 * GRID_H));
            sizeEx = 0.03;
            colorBackground[]={1,0,0,0.6};
            class Controls
            {
                class loadoutInfo: RscStructuredText {
                    idc = IDC_report_textBox;
                    text = "";
                    //type = 13; //CT_STRUCTURED_TEXT;  // defined constant
                    x = 0;
                    y = 0;
                    w = 2;
                    h = 20;
                    size = QUOTE(4 * GRID_H);
                    colorBackground[]={0,0,0,0.6};
                };
            };
        };
    };

};