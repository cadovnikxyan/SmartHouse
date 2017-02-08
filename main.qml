import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.1


Window {
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("Hello World")

    SwipeView{
        id: view

            currentIndex: 1
            anchors.fill: parent

            Item {

                id: leftPage
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
