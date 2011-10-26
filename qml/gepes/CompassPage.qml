import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.sensors 1.2

Page {
    tools: commonTools

    property int orientationAngle: 0

    Image {
        id: windrose
        source: "../../images/windrose.svg"
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.bottomMargin: 30
    }
    Image {
        id: compassArrow
        anchors.bottom: windrose.verticalCenter
        anchors.horizontalCenter: windrose.horizontalCenter
        height: windrose.paintedHeight / 2
        fillMode: Image.PreserveAspectFit
        source: "../../images/north_arrow.svg"
        rotation: - compass.azimuth - orientationAngle
        transformOrigin: Item.Bottom
    }
    Label {
        text: qsTr("Azimuth:") + " " + (360 - compass.azimuth) + "° (" + qsTr("accuracy") +    " " + Math.round(100 * compass.calibration) + "%)"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
    }
    OrientationSensor {
        id: orientation
        active: true

        onReadingChanged: {
            if (reading.orientation == OrientationReading.TopUp) {
                orientationAngle = 0;
            } else if (reading.orientation == OrientationReading.RightUp) {
                orientationAngle = 90;
            }
        }
    }
}
