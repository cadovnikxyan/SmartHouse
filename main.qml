import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: window
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("SmartHouse")
     header: ToolBar {
         id:toolbarHeader
         Text{
             id:textHeader
             text:"Main"
         }
         anchors.centerIn: parent.Center
         anchors.horizontalCenter: parent.horizontalCenter

     }
     footer:ToolBar{
         id:toolbarFooter
     }

    SwipeView{
        id: view
onCurrentIndexChanged:function(){
    switch(view.currentIndex){
    case 0:
        textHeader.text="Left"
        break
    case 1:
        textHeader.text="Main"
        break
    case 2:
        textHeader.text="Right"
        break
    }
}
            currentIndex: 1
            anchors.fill: parent
            Item {
               LeftPage{
                   id: left
               }
            }
            Item {
               MiddlePage{
                   id: middle
               }
            }
            Item {
                RightPage{
                    id:right
                }
            }
            Drawer {
                id: drawer
                width: 0.66 * window.width
                height: window.height
                position: 0.1
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
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        delegate: Rectangle {
               implicitWidth: 20
               implicitHeight: 20

               radius: width / 2
               color: "#21be2b"

               opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

               Behavior on opacity {
                   OpacityAnimator {
                       duration: 100
                   }
                }
            }
        }

    }
