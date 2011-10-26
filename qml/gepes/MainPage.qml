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

        GPSBase {
        }

        Column {
            spacing: 25

            Label {
                text: qsTr("Tools")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

            Button {
                text: qsTr("Sun")
                onClicked: appWindow.pageStack.push(sunPage)
            }

            Button {
                text: qsTr("Moon")
                onClicked: appWindow.pageStack.push(moonPage)
            }

            Button {
                text: qsTr("Compass")
                onClicked: appWindow.pageStack.push(compassPage)
            }

            Button {
                text: qsTr("GPS details")
                onClicked: appWindow.pageStack.push(gpsPage)
            }

        }
    }
}
