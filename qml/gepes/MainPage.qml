import QtQuick 1.1
import com.nokia.meego 1.0

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
                text: qsTr("Position")
                font.pixelSize: 26
                font.weight: Font.DemiBold
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
        Column {
            spacing: 25

            Label {
                text: qsTr("Tools")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

            Button {
                text: qsTr("Sun & moon")
                onClicked: appWindow.pageStack.push(sunPage)
            }

            Button {
                text: qsTr("Compass")
                onClicked: appWindow.pageStack.push(compassPage)
            }

        }
    }

    function printNum(num) {
        return Math.round(num) / 10;
    }
}
