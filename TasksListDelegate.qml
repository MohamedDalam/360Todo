import QtQuick 2.0
import QtQuick.Layouts 1.2

Item {
    id: _root
    implicitWidth: 200
    implicitHeight: 40

    property alias text: description.text
    property bool isActive
    signal activeStateChanged()
    signal itemHover()
    signal removeClicked()

    RowLayout{
        anchors.fill: parent
        Item{
            id: descriptionContainer
            height: parent.height
            width: description.width + 30
            Layout.preferredWidth: descriptionContainer.width
            Layout.preferredHeight: 40
            state: isActive ? "active" : "deActive"

            CheckedIndicator{
                id:checkedIndicator
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                width: 14
                height: 14
            }

            Text {
                id: description
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: checkedIndicator.right
                anchors.leftMargin: 10
                font.pixelSize: 16
            }

            states: [
                State {
                    name: "active"
                    PropertyChanges { target: checkedIndicator; color: "transparent" }
                    PropertyChanges { target: description; opacity: 1.0;  font.strikeout: false;}
                },
                State {
                    name: "deActive"
                    PropertyChanges { target: checkedIndicator; color: style.primaryColorMain }
                    PropertyChanges { target: description; opacity: 0.5;  font.strikeout: true;}
                }
            ]

            transitions: [
                Transition {
                    from: "*"; to: "*"
                    PropertyAnimation { target: checkedIndicator; properties: "color"; duration: 200 }
                    PropertyAnimation { target: description; properties: "opacity"; duration: 200 }
                }
            ]
        }

        Rectangle{
            id: removeIcon
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 20
            width: 16
            height: 16
            color: "transparent"
            visible: false

            Image {
                anchors.fill: parent
                source: "qrc:/Icons/Remove.svg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    MouseArea{
        id: area
        anchors.fill: parent
        hoverEnabled: true
        onEntered: removeIcon.visible = true
        onExited: removeIcon.visible = false
        onClicked: (mouse) => {
                       if(mouse.x >= removeIcon.x && mouse.x < (removeIcon.x + removeIcon.width)){
                           removeClicked()
                       }
                       else{
                           _root.activeStateChanged()
                           descriptionContainer.state = descriptionContainer.state === "active" ?  "deActive" : "active"
                       }}
    }
}
