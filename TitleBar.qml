import QtQuick 2.12
import QtQuick.Layouts 1.2

Item{
    id: _root
    property alias actualHeight: _root.height
    width: parent.width

    Rectangle{
        id:background
        anchors.fill: parent
        gradient: Gradient{
            GradientStop {position: 0.0; color: style.primaryColorMain }
            GradientStop {position: 1.0; color: style.primaryColorLight }
        }
        radius: 5
    }

    RowLayout{
        anchors.fill: parent
        id: titleBar
        Text {
            id: title
            text: "Daily Tasks"
            color: "white"
            font.pixelSize: 20
            font.bold: true
            Layout.leftMargin: 10
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            id: date
            text: "15-06-2021"
            color: "white"
            font.pixelSize: 16
            font.bold: false
            Layout.rightMargin: 10
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }
    }
}
