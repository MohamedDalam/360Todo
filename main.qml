import QtQuick 2.12
import QtQuick.Layouts 1.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import ModelLib 1.0

Window {
    id: root
    width: 400
    height: 600
    visible: true
    color: "black"

    ModelTodo {
        id: modelTodo
    }

    ColumnLayout{
        anchors.centerIn: parent
        width: 400
        height: 600
        TitleBar{
            actualHeight: 60
            Layout.fillWidth: true
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "white"

            ListView{
                model: modelTodo
                height: 200
                width: parent.width
                clip: true
                delegate: Text {
                    id: txt
                    text: model.description

                    MouseArea{
                        anchors.fill: parent
                        onClicked: modelTodo.remove(model.index)
                    }
                }
            }

        }
        Button{
            focus: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            id: btnNewTask
            text: "Add"
            onClicked: modelTodo.append(false,"Hello")
        }
    }
}
