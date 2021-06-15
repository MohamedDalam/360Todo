import QtQuick 2.12
import QtQuick.Layouts 1.2

Item{
    id: _root
    property alias actualHeight: _root.height
    width: parent.width

    Rectangle{
        id:background
        anchors.fill: parent
        color: "red"
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
    }
}
