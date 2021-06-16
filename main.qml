import QtQuick 2.12
import QtQuick.Layouts 1.2
import QtQuick.Window 2.12
import ModelLib 1.0

Window {
    id: root
    width: 400
    height: 600
    visible: true
    color: "lightGray"

    ModelTodo {
        id: modelTodo
    }

    Style{
        id:style
    }

    ColumnLayout {
        id: listContainer
        anchors.centerIn: parent
        height: 600
        width: 400

        TitleBar{
            actualHeight: 60
            Layout.fillWidth: true
        }

        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.bottomMargin: 40
            color: "white"
            radius: 5

            ListView{
                id: tasksList
                model: modelTodo
                implicitHeight: 100
                width: parent.width
                height: listContainer.height /*{modelTodo.count * 40; console.log("Count " + modelTodo.count)}*/
                clip: true
                delegate: TasksListDelegate{
                    width: tasksList.width
                    text: model.description
                    isActive: model.active
                    onActiveStateChanged: {
                        modelTodo.changeActiveState(model.index)
                    }
                    onRemoveClicked: modelTodo.remove(model.index)

                }
                add: Transition {
                    NumberAnimation {
                        properties: "x"; from: tasksList.width; to: 0
                        duration: 250; easing.type: Easing.InCirc
                    }
                }
                remove: Transition {
                    NumberAnimation {
                        properties: "x"; from: 0; to: tasksList.width;
                        duration: 250; easing.type: Easing.InCirc
                    }
                }
                displaced: Transition {
                    SequentialAnimation {
                        PauseAnimation { duration: 250 }
                        NumberAnimation { properties: "y"; duration: 75
                        }
                    }
                }
            }
            InputContainer{
                width: parent.width
                anchors.top: parent.bottom
                anchors.topMargin: - 20
                model: modelTodo
            }
        }
    }
}
