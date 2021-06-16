import QtQuick 2.0

Item {
    id: _root

    height: 40
    width: 180

    property color btnColor : style.secondaryColorMain
    property color fontColor : style.fontTextColor
    property alias text: name.text

    signal clicked()

    Rectangle{
        height: _root.height
        width: _root.width
        color: _root.btnColor
        radius: 10
        Text {
            id: name
            anchors.centerIn: parent
            color: _root.fontColor
            font.bold: true
            font.pixelSize: 20
        }
        MouseArea{
            anchors.fill: parent
            onClicked: _root.clicked()
        }
    }
}
