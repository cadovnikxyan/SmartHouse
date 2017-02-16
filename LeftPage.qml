import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1


ColumnLayout{
    spacing: 5
    anchors.centerIn: parent.Center
    anchors.horizontalCenter: parent.horizontalCenter
    Text{
        id: leftText
        text: "Левая страница"
    }
    Dialog{
        id: msgD
        title: qsTr("Диалог")
   ColumnLayout{
          Label {
              text: "Lorem ipsum..."
          }
          TextInput{
              id:textIn
              text:"Введите текст"
              height: parent.height
           }
          MouseArea{
              anchors.fill: parent
          onClicked: function(){
              textIn.text="";
           }
          }
        }
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        height: parent.parent.height /2
        width: parent.parent.width / 2
        onAccepted: function(){
            leftText.text=textIn.text
            }
    }
    Button {
        id: leftButton
        text: "Левая кнопка"
        anchors.centerIn: parent.Center
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: function(){
            console.log("leftButton clicked!")
            msgD.open()

        }
    }
}

