import Qt 4.7
import QtQuick 1.1
import com.nokia.meego 1.0

import "./sun.js" as Sun


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

            Label {
                id: moon_phase;
                property double phase: Sun.get_moon_phase() * 100;
                property string phase_name: (moon_phase < 1 ? qsTr("New moon") :
                                             moon_phase < 24 ? qsTr("Waxing crescent") :
                                             moon_phase < 26 ? qsTr("First quarter") :
                                             moon_phase < 49 ? qsTr("Waxing gibbous") :
                                             moon_phase < 51 ? qsTr("Full moon") :
                                             moon_phase < 74 ? qsTr("Waning gibbous") :
                                             moon_phase < 76 ? qsTr("Last quarter") :
                                             moon_phase < 99 ? qsTr("Waning crescent ") :
                                             qsTr("Dark moon"));
                text: qsTr("Moon phase:") + " " + Math.round(phase) + " % (" + phase_name + ")";
            }



        }
    }
}
