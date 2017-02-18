import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    objectName: "mainWindow"
    function myQmlFunction(msg) {
          console.log("Got message:", msg)
          textFooter.text=msg;
          return "some return value"
      }
    function toolFooterUpdate(msg){
        textFooter.text=msg;
        return "ok"
    }

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
         Text{
             id:textFooter
             text:""
         }
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
         SwipePage{
             id: swipe
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
