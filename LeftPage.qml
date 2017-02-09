import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1



ColumnLayout{
    spacing: 10
    Text{
        text: "Левая страница"
    }
    Button {
        id: leftButton
        text: "Левая кнопка"
        anchors.centerIn: parent.Center
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: console.log("leftButton clicked!")
    }
}
