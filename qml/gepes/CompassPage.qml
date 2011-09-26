import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Column {
        spacing: 25
        anchors.margins: 25

        Label {
            text: qsTr("Compass")
            font.pixelSize: 26
            font.weight: Font.DemiBold
        }

        Label {
            text: qsTr("Azimuth:") + " " + compass.azimuth + " (accurancy " + compass.calibration + ")"
        }

        Image {
            id: windrose
            source: "../../images/windrose.svg"
        }
    }
}
