import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.location 1.1

import "./gps.js" as GPS

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

        GPSBase {
        }

        Column {
            spacing: 25

            Label {
                text: qsTr("Accuracy")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

            Label {
                text: qsTr("Vertical:") + " " + (positionSource.position.verticalAccuracyValid ? "± " + GPS.printNum(positionSource.position.verticalAccuracy) + " m"  : qsTr("N/A"))
            }

            Label {
                text: qsTr("Horizontal:") + " " + (positionSource.position.horizontalAccuracyValid ? "± " + GPS.printNum(positionSource.position.horizontalAccuracy) + " m"  : qsTr("N/A"))
            }

            Label {
                text: qsTr("Source:") + " " + printMethod(positionSource.positioningMethod)
            }

        }
    }

    function printMethod(method) {
        if (method == PositionSource.SatellitePositioningMethod)
            return "Satellite";
        else if (method == PositionSource.NoPositioningMethod)
            return "Not available"
        else if (method == PositionSource.NonSatellitePositioningMethod)
            return "Non-satellite"
        else if (method == PositionSource.AllPositioningMethods)
            return "All/multiple"
        return "source error";
    }
}
