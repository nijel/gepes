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
        spacing: 10

        Column {
            spacing: 25

            Label {
                text: qsTr("Sun")
            }
        }
        Column {
            spacing: 25

            Label {
                text: qsTr("Moon")
            }

        }
    }
}
