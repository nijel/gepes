import QtQuick 1.1
import com.nokia.meego 1.0

import "./settings.js" as Settings

Page {
    tools: commonTools

    Grid {
        columns: screen.currentOrientation == Screen.Landscape || screen.currentOrientation == Screen.LandscapeInverted ? 2 : 1
        anchors.margins: 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: 25

        Column {
            spacing: 25

            Label {
                text: qsTr("Sensors")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

            Label {
                text: qsTr("Refresh frequency:") + " " + (refreshSlider.value == 0 ? qsTr("auto") : refreshSlider.value / 1000 + "s")
            }

            Slider {
                id: refreshSlider
                minimumValue: -1
                maximumValue: 60000
                stepSize: 1000
                value: 0
                onVisibleChanged: if (!visible && minimumValue == 0) {
                                      Settings.setSetting("refresh-rate", value);
                                      setRefreshRate();
                                  }
            }

        }

        Column {
            spacing: 25

            Label {
                text: qsTr("Appearance")
                font.pixelSize: 26
                visible: false
                font.weight: Font.DemiBold
            }

        }
    }

    Component.onCompleted: {
        Settings.initialize();
        refreshSlider.value = Settings.getSetting("refresh-rate", 0);
        refreshSlider.minimumValue = 0
    }
}
