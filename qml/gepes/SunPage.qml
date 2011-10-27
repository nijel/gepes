import Qt 4.7
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

import "./sun.js" as Sun
import "./gps.js" as GPS

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
                id: dateButton
                text: Qt.formatDate(value)
                property date value: new Date()
                onClicked: open_date_dialog()
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

                Grid {
                    spacing: 25
                    columns: 2

                    Label {
                        text: qsTr("Sun rise:")
                    }

                    Label {
                        id: sun_rise
                        property double julian: Sun.sun_rise(dateButton.value, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude);
                        property date date: Sun.calendar_date(julian)
                        text: Qt.formatTime(date, Qt.DefaultLocaleLongDate)
                    }

                    Label {
                        text: qsTr("Solar noon:")
                    }

                    Label {
                        id: sun_noon
                        property double julian: Sun.solar_transit(dateButton.value, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude);
                        property date date: Sun.calendar_date(julian)
                        text: Qt.formatTime(date, Qt.DefaultLocaleLongDate)
                    }

                    Label {
                        text: qsTr("Sun set:")
                    }

                    Label {
                        id: sun_set
                        property double julian: Sun.sun_set(dateButton.value, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
                        property date date: Sun.calendar_date(julian)
                        text: Qt.formatTime(date, Qt.DefaultLocaleLongDate)
                    }
                }
            }

            Column {

                Label {
                    text: qsTr("Azimuth")
                    font.pixelSize: 26
                    font.weight: Font.DemiBold
                }

                Grid {
                    columns: 3
                    spacing: 25

                    Label {
                        text: qsTr("Sun rise:")
                    }
                    Label {
                        id: sun_rise_azimuth
                        property double angle: Sun.sun_azimuth(sun_rise.date, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
                        text: GPS.to_deg(angle)

                    }
                    ListButton {
                        text: ">>"
                        onClicked: show_sun_compass(sun_rise_azimuth.angle)
                    }

                    Label {
                        text: qsTr("Sun set:")
                    }
                    Label {
                        id: sun_set_azimuth
                        property double angle: Sun.sun_azimuth(sun_set.date, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
                        text: GPS.to_deg(angle)
                    }
                    ListButton {
                        text: ">>"
                        onClicked: show_sun_compass(sun_set_azimuth.angle)
                    }

                    Label {
                        text: qsTr("Sun position:")
                    }
                    Label {
                        id: sun_position_azimuth
                        property date date: new Date()
                        property double angle: Sun.sun_azimuth(date, positionSource.position.coordinate.latitude, positionSource.position.coordinate.longitude)
                        text: GPS.to_deg(angle)
                    }
                    ListButton {
                        text: ">>"
                        onClicked: show_sun_compass(sun_position_azimuth.angle)
                    }
                }
            }
        }
    }

    function adjust_date(diff) {
        var newdate = new Date();
        newdate.setTime(dateButton.value.getTime() + diff);
        dateButton.value = newdate;
    }

    function open_date_dialog() {
        dtDialog.day = dateButton.value.getDate();
        dtDialog.month = dateButton.value.getMonth() + 1;
        dtDialog.year = dateButton.value.getFullYear();
        dtDialog.open();
    }

    function set_date_dialog() {
        var d = new Date(dtDialog.year, dtDialog.month - 1, dtDialog.day);
        dateButton.value = d;
    }

    DatePickerDialog {
        id: dtDialog
        titleText: qsTr("Choose date")
        acceptButtonText: qsTr("Ok")
        rejectButtonText: qsTr("Cancel")
        onAccepted: set_date_dialog();

    }

    function show_sun_compass(azimuth) {
        sunCompassPage.sunAzimuth = azimuth;
        appWindow.pageStack.push(sunCompassPage);
    }

    SunCompassPage {
        id: sunCompassPage;
    }
    Timer {
        interval: 30000;
        running: true;
        repeat: true
        onTriggered: sun_position_azimuth.date = new Date()
    }
}
