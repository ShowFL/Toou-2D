import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        id:layout
        spacing: 18

        Repeater{
            model: [
                {s:TAwesomeType.FA_bus,c:"#46A0FC"},
                {s:TAwesomeType.FA_cog,c:"#46A0FC"},
                {s:TAwesomeType.FA_qq,c:"#6AC044"},
                {s:TAwesomeType.FA_github,c:"#6AC044"},
                {s:TAwesomeType.FA_google_plus_circle,c:"#E4A147"},
                {s:TAwesomeType.FA_coffee,c:"#E4A147"},
                {s:TAwesomeType.FA_flag,c:"#F36D6F"},
                {s:TAwesomeType.FA_facebook_official,c:"#F36D6F"}
            ];

            delegate: TAwesomeIcon{
                width: 25;
                height: 25;
                source: modelData.s;
                color: modelData.c;
            }
        }
    }
}
