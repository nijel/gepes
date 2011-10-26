import QtQuick 1.1
import com.meego 1.0

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
                text: qsTr("Location based tools")
            }
            Label {
                color: "white"
                text: qsTr("Version:") + " " + "0.1.0"
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
                text: qsTr("Website:") + " http://gitorious.org/gepes"
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
            onClicked: Qt.openUrlExternally('http://gitorious.org/gepes')
        }
        Button {
            text: qsTr("Donate")
            onClicked: Qt.openUrlExternally('http://cihar.com/donate/')
        }
    }
}
