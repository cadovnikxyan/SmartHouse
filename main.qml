import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1


ApplicationWindow {
    id: window
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("SmartHouse")
     header: ToolBar {
         id:toolbar
     }

    SwipeView{
        id: view

            currentIndex: 1
            anchors.fill: parent

            Item {

               LeftPage{
                id: left
               }



            }
            Item {
                id: secondPage
                Text{
                    text: "Средняя страница"
                }

            }
            Item {
                id: thirdPage
                Text{
                    text: "Правая страница"
                }
            }
            Drawer {
                id: drawer
                width: 0.66 * window.width
                height: window.height
                position: 0.3
                Text{
                    text:"SwipeMenu"

                    transform: Translate {
                        x: drawer.position * content.width * 0.33
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
