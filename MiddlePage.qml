import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1



GridView{
id:gridView
    Component {
        id: highlight
        Rectangle {
            width: gridView.cellWidth; height: gridView.cellHeight
            color: "lightsteelblue"; radius: 5
            x: gridView.currentItem.x
            y: gridView.currentItem.y
            Behavior on x { SpringAnimation { spring: 3; damping: 0.2 } }
            Behavior on y { SpringAnimation { spring: 3; damping: 0.2 } }

        }
    }
    cellWidth: 180
    cellHeight: 180
    highlight: highlight
    width:parent.width
    height:parent.height
    model:ListModel{
                  id:mainModel

                  ListElement {
                      name: "cable"
                      portrait: ":/../../icons/cable.png"
                  }
                  ListElement {
                      name: "chip"
                      portrait: ":/../../icons/chip-1.png"
                  }
                  ListElement {
                      name: "computer"
                      portrait: ":/../../icons/computer.png"
                  }
                  ListElement {
                      name: "cpu"
                      portrait: ":/../../icons/cpu.png"
                  }
                }
                  delegate:Component {
                              id: rectDelegate
                              Rectangle {
                                  id: rect

                                  width: 180
                                  height: 180
                                  color: '#f0f8ff'
                                  Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
                                  BorderImage {
                                      width: 180; height: 180
                                      border { left: 30; top: 30; right: 30; bottom: 30 }
                                      horizontalTileMode: BorderImage.Stretch
                                      verticalTileMode: BorderImage.Stretch
                                      source: portrait
                                  }
                                  MouseArea {
                                      anchors.fill: parent
                                      onClicked: gridView.currentIndex = index
                                  }
                                  states: [

                                      State {
                                          name: "none"
                                          when: rect.GridView.isCurrentItem
                                          PropertyChanges {
                                              target: rect;
                                              height: 50;
                                              width: 50;
                                          }
                                      },
                                      State {
                                          name: "selected"
                                          when: (gridView.currentIndex == -1)
                                      }
                                  ]
                                  transitions: Transition {
                                      PropertyAnimation {
                                          target: rect
                                          easing.period: 0.5
                                          easing.amplitude: 2
                                          duration: 460
                                          easing.type: Easing.InSine
                                          properties: "width, height"
                                      }
                                  }
                              }
                          }


                  flickableChildren: MouseArea {
                              anchors.fill: parent
                              onClicked: gridView.currentIndex = -1
                          }
                  Component.onCompleted: currentIndex = -1
      focus: true
  }


