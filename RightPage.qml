import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1



ColumnLayout{
    spacing: 10
    anchors.centerIn: parent.Center
    anchors.horizontalCenter: parent.horizontalCenter
    Text{
        text: "Правая страница"
    }
    Button {
        id: rightButton
        signal qmlSignal(string msg)
        text: "Правая кнопка"
        anchors.centerIn: parent.Center
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: function () {
            console.log("rightButton clicked!")
            rightButton.qmlSignal("hello from qml")
        }
    }
}
