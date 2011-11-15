import QtQuick 1.1
import com.nokia.meego 1.0

 Dialog {
    id: aboutDialog
    title: Item {
        id: titleField
        height: 40
        width: parent.width
        Label {
            font.pixelSize: 38
            anchors.centerIn: parent
            color: "white"
            text: "GePeS"
        }
    }

    content:Item {
        id: contentField
        height: 170
        width: parent.width
        Column {
            spacing: 5
            anchors.centerIn: parent
            Label {
                color: "white"
                text: qsTr("GPS and compass based tools")
            }
            Label {
                color: "white"
                text: qsTr("Version:") + " " + "0.1.2"
            }
            Label {
                color: "white"
                text: "Copyright (c) 2011 Michal Čihař"
            }
            Label {
                color: "white"
                text: qsTr("Email:") + " <michal@cihar.com>"
            }
            Label {
                color: "white"
                text: qsTr("Website:") + " http://cihar.com/software/gepes/"
            }
        }
    }

    buttons: ButtonColumn {
        style: ButtonStyle { }
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            text: qsTr("Ok");
            onClicked: aboutDialog.accept()
        }
        Button {
            text: qsTr("Open website");
            onClicked: Qt.openUrlExternally('http://cihar.com/software/gepes/')
        }
        Button {
            text: qsTr("Donate")
            onClicked: Qt.openUrlExternally('http://cihar.com/donate/')
        }
    }
}
