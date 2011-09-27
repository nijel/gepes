import Qt 4.7
import QtQuick 1.1
import com.nokia.meego 1.0

import "./sun.js" as Sun


Page {
    tools: commonTools

    Column {
        anchors.margins: 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: 25

        ButtonRow {
            exclusive: false

            Button {
                text: "-"
                onClicked: adjust_date(-86400000)
            }
            Button {
                id: date
                text: Qt.formatDate(value)
                enabled: false
                property date value: new Date()
            }
            Button {
                text: "+"
                onClicked: adjust_date(86400000)
            }

        }

        Grid {
            columns: screen.currentOrientation == Screen.Landscape || screen.currentOrientation == Screen.LandscapeInverted ? 2 : 1
            spacing: 25

            Column {

                Label {
                    text: qsTr("Sun")
                    font.pixelSize: 26
                    font.weight: Font.DemiBold
                }

                Label {
                    id: sun_rise
                    property double julian: Sun.sun_rise(date.value, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude);
                    text: qsTr("Sun rise:") + " " + Qt.formatTime(Sun.calendar_date(julian), Qt.DefaultLocaleLongDate)
                }
                Label {
                    id: sun_set
                    property double julian: Sun.sun_set(date.value, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
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
                    property double phase: Sun.moon_phase(date.value) * 100;
                    property string phase_name: get_phase_name(phase)
                    text: qsTr("Moon phase:") + " " + Math.round(phase) + " % (" + phase_name + ")";
                }

                Image {
                    source: get_moon_image(moon_phase.phase)
                }
            }
        }
    }

    function adjust_date(diff) {
        var newdate = new Date();
        newdate.setTime(date.value.getTime() + diff);
        date.value = newdate;
    }

    function get_phase_name(moon_phase) {
        if (moon_phase < 1.0) {
            return qsTr("New moon");
        } else if (moon_phase < 24.0) {
            return qsTr("Waxing crescent");
        } else if (moon_phase < 26.0) {
            return qsTr("First quarter");
        } else if (moon_phase < 49.0) {
            return qsTr("Waxing gibbous");
        } else if (moon_phase < 51.0) {
            return qsTr("Full moon");
        } else if (moon_phase < 74.0) {
            return qsTr("Waning gibbous");
        } else if (moon_phase < 76.0) {
            return qsTr("Last quarter");
        } else if (moon_phase < 99.0) {
            return qsTr("Waning crescent ");
        } else {
            return qsTr("Dark moon");
        }
    }

    function get_moon_image(phase) {
        var num = Math.round(phase / 10) % 10;
        return "../../images/moon-" + num + "0.png";
    }
}
