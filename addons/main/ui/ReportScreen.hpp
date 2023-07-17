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
            x = QUOTE(safezoneW  + safezoneX - 32 * GRID_W);
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(30 * GRID_W);
            h = QUOTE(7 * GRID_H);
            sizeEx = QUOTE(5 * GRID_H);
            text = "Close";
            shortcuts[]= {"0x01"};
            tooltip= "";
            onButtonClick = QUOTE(ctrlParent (_this select 0) closeDisplay 2);
        };

        class loadoutInfo: RscStructuredText {
            idc = IDC_report_textBox;
            text = "";
            //type = 13; //CT_STRUCTURED_TEXT;  // defined constant
            x = QUOTE(safezoneX + (20 * GRID_W));
            y = QUOTE(safezoneY + (5 * GRID_H));
            w = QUOTE(160 * GRID_W);
            h = QUOTE(safezoneH - (34 * GRID_H));
            sizeEx = QUOTE(5 * GRID_H);
            colorBackground[]={0,0,0,0.6};
        };
    };

};