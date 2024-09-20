import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: display
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.2
        border.color: "black"
        radius: 10
        color: "orange"
        opacity: 0.5
        anchors.margins: 5
        focus: true

        Text {
            id: totalText
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: values.top
            font.pixelSize: parent.height * 0.35
            color: "black"
            text: qsTr("")

        }

        Text  {
            id: values
            anchors.right: parent.right
            anchors.top: totalText.bottom + 20
            anchors.bottom: parent.bottom
            font.pixelSize: parent.height * 0.5
            color: "black"
            text: qsTr("0")
        }
    }

    Rectangle {
        anchors.top: display.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5
        color: "orange"
        opacity: 0.5
        radius: 10
        height: parent.height * 0.77

        GridLayout {
            columns: 5
            rows: 5
            anchors.fill: parent
            columnSpacing: 4
            rowSpacing: 4

            Rectangle {
                Layout.row: 0
                Layout.column: 0
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "yellow"
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("%")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text.includes(".") || values.text > 0 || values.text < 0){
                            values.text += "%"
                            totalText.text = values.text
                            values.text = ""
                        }

                    }
                }
            }
            Rectangle {
                Layout.row: 0
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: qsTr("CE")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text = ""
                    }
                }
            }
            Rectangle {
                Layout.row: 0
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("C")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text = ""
                        totalText.text = ""
                    }
                }
            }
            Rectangle {
                Layout.row: 0
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("<-")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text = values.text.slice(0,-1)
                    }
                }
            }
            Rectangle {
                Layout.row: 1
                Layout.column: 0
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("(")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text += "("
                    }
                }
            }
            Rectangle {
                Layout.row: 1
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr(")")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        values.text += ")"
                    }
                }
            }
            Rectangle {
                Layout.row: 1
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: qsTr("None")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text += ""
                    }
                }
            }
            Rectangle {
                Layout.row: 1
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("/")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        values.text += "/"
                        totalText.text += values.text
                        values.text = ""
                    }
                }
            }
            Rectangle {

                Layout.row: 2
                Layout.column: 0
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    id: number7
                    anchors.centerIn: parent
                    text: qsTr("7")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "7"
                    }
                }
            }
            Rectangle {
                Layout.row: 2
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("8")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "8"
                    }
                }

            }
            Rectangle {
                Layout.row: 2
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("9")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "9"
                    }
                }
            }
            Rectangle {
                Layout.row: 2
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("*")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text += "*"
                        totalText.text += values.text
                        values.text = ""
                    }
                }
            }
            Rectangle {
                Layout.row: 3
                Layout.column: 0
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("4")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "4"
                    }
                }
            }
            Rectangle {
                Layout.row: 3
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("5")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "5"
                    }
                }
            }
            Rectangle {
                Layout.row: 3
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("6")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "6"
                    }
                }
            }
            Rectangle {
                Layout.row: 3
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("-")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text += "-"
                        totalText.text += values.text
                        values.text = ""
                    }
                }
            }
            Rectangle {
                Layout.row: 4
                Layout.column: 0
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("1")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "1"
                    }
                }
            }
            Rectangle {
                Layout.row: 4
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("2")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "2"
                    }
                }
            }
            Rectangle {
                Layout.row: 4
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("3")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "3"
                    }
                }
            }
            Rectangle {
                Layout.row: 4
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("+")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        values.text += "+"
                        totalText.text += values.text
                        values.text = ""
                    }
                }
            }
            Rectangle {
                Layout.row: 5
                Layout.column: 0
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("+/-")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text.includes(".") || values.text > 0 || values.text < 0){
                            if (values.text.startsWith("-")) {
                                // Remove the '-' sign from the start of the text
                                values.text = values.text.substring(1);
                            } else {
                                // Add a '-' sign to the start of the text
                                values.text = "-" + values.text;
                            }
                        }
                    }
                }
            }
            Rectangle {
                Layout.row: 5
                Layout.column: 1
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("0")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text[0] === "0" && values.text[1] !== "."){
                            values.text = values.text.slice(1)
                        }
                        values.text += "0"
                    }
                }

            }
            Rectangle {
                Layout.row: 5
                Layout.column: 2
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr(".")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text === ""){
                            values.text += "0."
                        } else {
                            values.text += "."
                        }
                    }
                }
            }
            Rectangle {
                Layout.row: 5
                Layout.column: 3
                color: "yellow"
                Layout.fillHeight: true
                Layout.fillWidth: true
                opacity: 0.7
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: qsTr("=")
                    font.bold: true
                    font.pixelSize: Math.min(parent.width, parent.height) * 0.4
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(values.text !== "") {
                            totalText.text += values.text
                            values.text = ""
                        }
                        Calculate.evaluateExpression(totalText.text)
                        totalText.text = ""
                    }
                }
            }
            Keys.onPressed: function(event){
                if(event.text >= "0" && event.text <= "9"){
                    if(values.text[0] === "0" && values.text[1] !== "."){
                        values.text = values.text.slice(1)
                    }
                    values.text +=event.text
                } else if(event.key === Qt.Key_Backspace) {
                    values.text = values.text.slice(0,-1)
                } else if(event.key === Qt.Key_Equal) {
                    if(values.text !== "") {
                        totalText.text += values.text
                        values.text = ""
                    }
                    Calculate.evaluateExpression(totalText.text)
                    totalText.text = ""
                } else if(event.key === Qt.Key_Plus){
                    values.text += "+"
                    totalText.text += values.text
                    values.text = ""
                } else if(event.key === Qt.Key_Minus){
                    values.text += "-"
                    totalText.text += values.text
                    values.text = ""
                } else if(event.text === "/"){
                    values.text += "/"
                    totalText.text += values.text
                    values.text = ""
                } else if(event.text === "*"){
                    values.text += "*"
                    totalText.text += values.text
                    values.text = ""
                } else if(event.key === Qt.Key_Percent){
                    values.text += "%"
                    totalText.text += values.text
                    values.text = ""
                } else if(event.text === ")") {
                    values.text += ")"
                    totalText.text += values.text
                    values.text = ""
                } else if (event.text === "(") {
                    values.text += "("
                    totalText.text += values.text
                    values.text = ""
                } else if (event.text === ".") {
                    if(values.text === ""){
                        values.text += "0."
                    } else if(!values.text.includes(".")){
                        values.text += "."
                    }
                }
            }
            Component.onCompleted: {
                    focus = true;
                }
        }
    }
}
