import QtQuick 2.0

Rectangle {
    id: root
    width: 15
    height: 15
    color: defaultColor

    property string name: "Unnamed Socket"
    property string type: "socket"

    property bool hovering: false
    property bool connecting: false

    property color defaultColor: "GRAY"
    property color connectingColor: Qt.lighter(defaultColor)
    property color connectedColor: "GREEN"

    signal clicked
    signal entered
    signal exited
    signal mouseMoved(int x, int y)

    function isInput() {
        return root.objectName === "input";
    }

    function isOutput() {
        return root.objectName === "output";
    }

    function isConnecting() {
        return state === "CONNECTING";
    }

    function isConnected() {
        return state === "CONNECTED";
    }

    function canConnectTo(otherSocket) {
        return (isInput() && otherSocket.isOutput()) || (isOutput() && otherSocket.isInput());
    }

    state: "NORMAL"
    states: [
        State {
            name: "NORMAL"
            when: !root.hovering && !root.connecting
        },
        State {
            name: "HOVERING"
            when: root.hovering && !root.connecting
            PropertyChanges { target: root; color: Qt.lighter(root.defaultColor) }
        },
        State {
            name: "CONNECTING"
            when: root.connecting
            PropertyChanges { target: root; color: root.connectingColor }
        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: root
        hoverEnabled: true
        propagateComposedEvents: true
        onEntered: {
            root.hovering = true;
            root.entered();
        }
        onExited: {
            root.hovering = false;
            root.exited();
        }
        onClicked: root.clicked();
        onPositionChanged: root.mouseMoved(mouseX, mouseY)
    }
}
