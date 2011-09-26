import Qt 4.7
import QtQuick 1.1
import com.nokia.meego 1.0

import "./sun.js" as Sun


Page {
    tools: commonTools
    //property int julian_date: Math.floor((Date().t.valueOf() / (1000 * 60 * 60 * 24)) - 0.5) + 2440588;

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
                text: qsTr("Sun")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

            Label {
                id: sun_rise
                property double julian: Sun.get_sun_rise(positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude);
                text: qsTr("Sun rise:") + " " + Qt.formatTime(Sun.calendar_date(julian), Qt.DefaultLocaleLongDate)
            }
            Label {
                id: sun_set
                property double julian: Sun.get_sun_set(positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
                text: qsTr("Sun set:") + " " + Qt.formatTime(Sun.calendar_date(julian), Qt.DefaultLocaleLongDate)
            }

        }
        Column {
            spacing: 25

            Label {
                text: qsTr("Moon")
                font.pixelSize: 26
                font.weight: Font.DemiBold
            }

        }
    }
}
