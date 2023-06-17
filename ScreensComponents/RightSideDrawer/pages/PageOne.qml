import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

import "../../../common"
Flickable {
    id: flickable
    contentHeight: root.implicitHeight
    property string name: "PageOne"

    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Drive by Car")
            }
            RowLayout {
                LabelSubheading {
                    id: availableCars
                    text: qsTr("Available Cars: ")
                }
                LabelSubheading {
                }
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Example APP demonstrating Qt Quick Controls 2\n\n")                }
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Car is a normal Page with a Counter visible in Drawer. Counter can be increased tapping on the 'add' Icon above.\nNavigation Drawer can be opened swiping from left or tapping on Menu Button.\nCar is marked as Favority, so you can also navigate from Bottom (in Portrait Mode)\n")
                }
            }
            RowLayout {
                LabelBodySecondary {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Activation Policy: ")
                }
                LabelBody {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("LAZY")
                }
            }
            HorizontalDivider {}
        } // col layout
    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    // emitting a Signal could be another option
    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        console.log(qsTr("Init done from Car"))
    }
    // called from Component.destruction
    function cleanup() {
        console.log(qsTr("Cleanup done from Car"))
    }
} // flickable
