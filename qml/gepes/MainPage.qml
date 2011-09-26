import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        spacing: 5

        Label {
            text: qsTr("Position")
        }

        Label {
            text: qsTr("Latitude:") + " " + (positionSource.position.latitudeValid ? positionSource.position.coordinate.latitude : qsTr("N/A"))
        }

        Label {
            text: qsTr("Longitude:") + " " + (positionSource.position.longitudeValid ? positionSource.position.coordinate.longitude : qsTr("N/A"))
        }

        Label {
            text: qsTr("Altitude:") + " " + (positionSource.position.altitudeValid ? printNum(positionSource.position.coordinate.altitude) + " m" : qsTr("N/A"))
        }

        Label {
            text: qsTr("Speed:") + " " + (positionSource.position.speedValid ? printNum(positionSource.position.speed) + " m/s" : qsTr("N/A"))
        }
    }

    function printNum(num) {
        return Math.round(num) / 10;
    }
}
