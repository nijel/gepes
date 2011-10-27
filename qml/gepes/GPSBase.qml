import QtQuick 1.0
import com.nokia.meego 1.0

import "./gps.js" as GPS

Column {
    spacing: 25

    Label {
        text: qsTr("Position")
        font.pixelSize: 26
        font.weight: Font.DemiBold
    }

    Label {
        text: qsTr("Latitude:") + " " + (positionSource.position.latitudeValid ? GPS.fmt_lat(positionSource.position.coordinate.latitude) : qsTr("N/A"))
    }

    Label {
        text: qsTr("Longitude:") + " " + (positionSource.position.longitudeValid ? GPS.fmt_lon(positionSource.position.coordinate.longitude) : qsTr("N/A"))
    }

    Label {
        text: qsTr("Altitude:") + " " + (positionSource.position.altitudeValid ? GPS.printNum(positionSource.position.coordinate.altitude) + " m"  : qsTr("N/A"))
    }

    Label {
        text: qsTr("Speed:") + " " + (positionSource.position.speedValid ? GPS.printNum(positionSource.position.speed) + " m/s (" + GPS.printNum(positionSource.position.speed * 3.6) + " km/h)" : qsTr("N/A"))
    }
}
