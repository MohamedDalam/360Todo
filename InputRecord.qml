import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2

Item {
    id: _root
    property string text: textField.text
    property bool isActive: true
    property alias textFiledWidth: textFieldBack.width

    signal enterPressed()
    function clearText(){
        textField.clear()
    }

    implicitWidth: 200
    implicitHeight: 40
    state: "active"

    RowLayout{
        spacing: 20
        anchors.fill: parent
        CheckedIndicator{
            id:checkedIndicator
            width: 14
            height: 14
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.leftMargin: 20
            onClicked: _root.state = _root.state === "active" ?  "deActive" : "active"
        }

        TextField{
            id: textField
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            background: Rectangle{
                id:textFieldBack
                border.width: 1
                border.color: style.primaryColorLight
                radius: 5
            }
            width: textFiledWidth
            placeholderText: "What is your next task?"
            onAccepted: _root.enterPressed()
        }
    }

    states: [
        State {
            name: "active"
            PropertyChanges {target: _root; isActive: true}
            PropertyChanges { target: checkedIndicator; color: "transparent" }
        },
        State {
            name: "deActive"
            PropertyChanges {target: _root; isActive: false}
            PropertyChanges { target: checkedIndicator; color: style.primaryColorMain }
        }
    ]
}
