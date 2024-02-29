import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 1.12
import QtQuick.Window 6.0
import QtMultimedia 6.0
import SddmComponents 2.0

Rectangle {
    color: "black"
    width: Window.width
    height: Window.height

    MediaPlayer {
        id: welcome
        source: "welcome.wav"
        audioOutput: AudioOutput {
            volume: 0.5
        }
        Component.onCompleted: play()
    }

    MediaPlayer {
        id: denied
        source: "denied.wav"
        audioOutput: AudioOutput {
            volume: 0.5
        }
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
        }
        function onLoginFailed() {
            denied.play()
        }
    }

    AnimatedImage {
        anchors.fill: parent
        source: "bgN5.gif"
        fillMode: Image.Tile
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        AnimatedImage {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 600
            Layout.preferredHeight: 600
            source: "WiredLogIn.gif"
        }

        AnimatedImage {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 60
            Layout.bottomMargin: 50
            source: "whoIsUser.gif"
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: "Ｕｓｅｒ ＩＤ："
            color: "#c1b492"
            font.pixelSize: 16
        }

        TextField {
            id: username
            Layout.alignment: Qt.AlignHCenter
            text: userModel.lastUser
            palette.text: "#c1b492"
            font.family: "MonaspiceXe Nerd Font"
            font.pixelSize: 16
            horizontalAlignment: Qt.AlignHCenter 
            background: Rectangle {
                implicitWidth: 200
                color: "#000"
                border.color: "#d2738a"
            }
            KeyNavigation.backtab: shutdownBtn; KeyNavigation.tab: password
			Keys.onPressed: function(event) {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    sddm.login(username.text, password.text, session.currentIndex)
                    event.accepted = true
                }
            }

        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: "Ｐａｓｓｗｏｒｄ："
            color: "#c1b492"
            font.pixelSize: 16
        }

        TextField {
            id: password
            Layout.alignment: Qt.AlignHCenter
            echoMode: TextInput.Password
            palette.text: "#c1b492"
            font.family: "MonaspiceXe Nerd Font"
            font.pixelSize: 16
            horizontalAlignment: Qt.AlignHCenter 
            background: Rectangle {
                implicitWidth: 200
                color: "#000"
                border.color: "#d2738a"
            }
            KeyNavigation.backtab: username; KeyNavigation.tab: session
			Keys.onPressed: function(event) {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(username.text, password.text, session.currentIndex)
					event.accepted = true
				}
			}
        }

        Item {
            width: 100
            height: 30
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
            Layout.bottomMargin: 50

            Rectangle {
                anchors.fill: parent
                color: "#d2738a"
            }

            Label {
                anchors.centerIn: parent
                text: "Ｌｏｇｉｎ"
                color: "#c1b492"
                font.pixelSize: 16
            }

            MouseArea {
                anchors.fill: parent
                onClicked: sddm.login(username.text, password.text, session.currentIndex)
            }
        }

    }

    AnimatedImage {
        id: shutdownBtn
        source: "VisLain.gif"
        fillMode: Image.PreserveAspectFit
        width: 80
        height: 80
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.topMargin: 10

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: sddm.powerOff()
            onEntered: {
				var component = Qt.createComponent("ShutdownToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(shutdownBtn);
					tooltip.x = -45
					tooltip.y = 60
				tooltip.destroy(600);
				}
			}
        }
    }

    AnimatedImage {
        id: rebootBtn
        source: "lain_myese.gif"
        fillMode: Image.PreserveAspectFit
        width: 60
        height: 70
        anchors.right: shutdownBtn.left
        anchors.rightMargin: 5
        anchors.verticalCenter: shutdownBtn.verticalCenter

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: sddm.reboot()
            onEntered: {
				var component = Qt.createComponent("RebootToolTip.qml");
				if (component.status == Component.Ready) {
					var tooltip = component.createObject(rebootBtn);
					tooltip.x = -45
					tooltip.y = 50
				tooltip.destroy(600);
				}
			}
        }
    }

    ComboBox {
		id: session
		height: 30
		width: 200
		x: 20
		y: 40
		model: sessionModel
		index: sessionModel.lastIndex
		color: "#000"
		borderColor: "#d2738a"
		focusColor: "#d2738a"
		hoverColor: "#d2738a"
		textColor: "#c1b492"
		arrowIcon: "/usr/share/sddm/themes/sddm-lain-wired-theme/angle-down.png"
		KeyNavigation.backtab: password; KeyNavigation.tab: rebootBtn;
	}

    Component.onCompleted: {
		if (username.text == "") {
			username.focus = true
		} else {
			password.focus = true
		}
	}
}

