import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1



GridView{
    anchors.centerIn: parent.Center
    anchors.horizontalCenter: parent.horizontalCenter

  model:ListModel{
      id:mainModel
          ListElement{
                    name: "first"

                }

          }
  delegate: Column {
         width: 200
         height: 20


      }
  }


