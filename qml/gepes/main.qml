import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.location 1.1
import QtMobility.sensors 1.1

import "./settings.js" as Settings

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

    SettingsPage {
        id: settingsPage
    }

    PositionSource {
        id: positionSource
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
            iconId: pageStack.depth > 1 ? "toolbar-back" : "toolbar-back-dimmed";
            onClicked: { if (pageStack.depth > 1) { /*myMenu.close();*/ pageStack.pop();} }
        }
        ToolIcon {
            iconId: "toolbar-refresh";
            onClicked: {positionSource.update();}
        }
        ToolIcon {
            iconId: "toolbar-settings";
            onClicked: appWindow.pageStack.push(settingsPage)
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

    Component.onCompleted: {
        Settings.initialize();
        setRefreshRate();
    }

    function setRefreshRate() {
        var rate = Settings.getSetting("refresh-rate", 15000);
        positionSource.updateInterval = rate;
        if (rate == 0) {
            compass.dataRate = 0;
        } else {
            compass.dataRate = 1 / (rate / 1000);
        }
    }
}
