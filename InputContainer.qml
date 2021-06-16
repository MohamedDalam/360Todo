import QtQuick 2.0

Item {
    id: _root
    implicitHeight: 40
    implicitWidth: 200

    property var model
    readonly property int _btnX: ((_root.width / 2) - (btnNewTask.width / 2))

    state: "view"

    InputRecord{
        id: inputRecord
    }

    PrimaryButton{
        id: btnNewTask
        x: _root._btnX
        anchors.verticalCenter: parent.verticalCenter
        text: "+ Add Task"
        focus: true
        onClicked: {
            if(_root.state == "add"){
                model.append(inputRecord.isActive,inputRecord.text);
                inputRecord.clearText();
            }
            _root.state = _root.state == "view" ? "add" : "view";
        }
    }

    states: [
        State {
            name: "view"
            PropertyChanges { target: inputRecord; opacity: 0.0; textFiledWidth: 0}
            PropertyChanges { target: btnNewTask; width: 180; height: 40; }
        },
        State {
            name: "add"
            PropertyChanges { target: inputRecord; opacity: 1.0; textFiledWidth: _root.width - 120}
            PropertyChanges { target: btnNewTask; text: "+"; width: 30; height: 30; x: _root.width - 50; }
        }
    ]

    transitions: [
        Transition {
            from: "view"; to: "add"
            NumberAnimation {
                properties: "x"; to: _root.width - 50
                duration: 250; easing.type: Easing.Linear
            }
            PropertyAnimation { target: inputRecord; properties: "opacity, textFiledWidth"; duration: 200 }
        },
        Transition {
            from: "add"; to: "view"
            NumberAnimation {
                properties: "x"; to: _root._btnX
                duration: 250; easing.type: Easing.Linear
            }
            PropertyAnimation { target: inputRecord; properties: "opacity, textFiledWidth"; duration: 200 }
        }
    ]
}
