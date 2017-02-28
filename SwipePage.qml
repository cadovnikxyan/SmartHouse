import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Drawer {
    id: drawer
    width: 0.66 * window.width
    height: window.height
    position: 0.1
    focus: true;
    Keys.enabled: true
    Keys.priority: Keys.BeforeItem
    Keys.onReleased: {
              if (event.matches(StandardKey.Back)) {
                  console.log("back caught by delegate");
                  event.accepted = false;
              }
              console.log("swipe");
          }
    ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
   }
    ListView {
        anchors.fill: parent
        model: fruitModel
        delegate: Row {

            Text { text: "Fruit: " + name }
            Text { text: "Cost: $" + cost }
            Button {text: "buy"; onClicked: function(){
            console.log("clicked on "+ name)}
            spacing: 3
        }
        }
    }
    background: Rectangle {
        Rectangle {
            x: parent.width - 1
            width: 1
            height: parent.height
            color: "#21be2b"
        }
    }
}
