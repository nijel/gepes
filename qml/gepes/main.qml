import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.location 1.1
import QtMobility.sensors 1.1

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    SunPage {
        id: sunPage
    }

    CompassPage {
        id: compassPage
    }

    GPSPage {
        id: gpsPage
    }

    PositionSource {
        id: positionSource
        updateInterval: 1000
        active: true
    }

    Compass {
        id: compass
        onReadingChanged: {azimuth = compass.reading.azimuth; calibration = compass.reading.calibrationLevel; }
        property real azimuth: 0
        property real calibration: 0
        active: true
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            iconId: "toolbar-back";
            onClicked: { /*myMenu.close();*/ pageStack.pop(); }
            visible: (pageStack.depth > 1);
        }
        ToolIcon {
            platformIconId: "toolbar-application";
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: aboutDialog.open();
        }
        /* Not used
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
        */
    }
    /* Not used
    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Sample menu item") }
        }
    }
    */

    AboutDialog {
        id: aboutDialog;
    }

}
