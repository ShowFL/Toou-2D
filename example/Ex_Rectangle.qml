import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        id:layout
        spacing: 10


        TRectangle{
            width: 100;
            height: 80;
            color: "#409EFF";
            radius: 2
            theme.enabled: false;
            TLabel{
                x:10;
                y:10;
                color: "#FFF"
                text: (parent.color + "").toUpperCase() ;
                theme.enabled: false;
            }

            Row{
                anchors.bottom: parent.bottom;
                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#DAECFE";
                    theme.enabled: false;
                }

                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#ECF5FF";
                    theme.enabled: false;
                }
            }
        }


        TRectangle{
            width: 100;
            height: 80;
            color: "#6AC044";
            radius: 2
            theme.enabled: false;
            TLabel{
                x:10;
                y:10;
                color: "#FFF"
                text: (parent.color + "").toUpperCase() ;
                theme.enabled: false;
            }

            Row{
                anchors.bottom: parent.bottom;
                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#E1F2D9";
                    theme.enabled: false;
                }

                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#F0F9EB";
                    theme.enabled: false;
                }
            }
        }


        TRectangle{
            width: 100;
            height: 80;
            color: "#E4A147";
            radius: 2
            theme.enabled: false;
            TLabel{
                x:10;
                y:10;
                color: "#FFF"
                text: (parent.color + "").toUpperCase() ;
                theme.enabled: false;
            }

            Row{
                anchors.bottom: parent.bottom;
                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#FAECD9";
                    theme.enabled: false;
                }

                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#FDF6ED";
                    theme.enabled: false;
                }
            }
        }


        TRectangle{
            width: 100;
            height: 80;
            color: "#F36D6F";
            radius: 2
            theme.enabled: false;
            TLabel{
                x:10;
                y:10;
                color: "#FFF"
                text: (parent.color + "").toUpperCase() ;
                theme.enabled: false;
            }

            Row{
                anchors.bottom: parent.bottom;
                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#FCE2E2";
                    theme.enabled: false;
                }

                TRectangle{
                    width: 50;
                    height: 30;
                    color: "#FEF0F0";
                    theme.enabled: false;
                }
            }
        }

    }

}
