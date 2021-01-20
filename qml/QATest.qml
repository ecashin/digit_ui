import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3  

import "polyconst.js" as Constants
Item {
	id: qa_test
	width: 1280//Screen.height
	height: 720//Screen.width

	Grid {
        width: 1280//Screen.height
        height: 720//Screen.width
		columns: 3
		spacing: 1
		Label {
			width: 300
			height: 150
			text: "knob left "+encoderQA["left"].value.toFixed(2)
			font {
				pixelSize: fontSizeLarge
			}
			background: Rectangle { color: encoderQA["left"].value < 0.9 ? "red" : "green"; width: parent.width; height: parent.height }
		}

		Label {
			width: 300
			height: 150
			text: "knob right "+encoderQA["right"].value.toFixed(2) 
			font {
				pixelSize: fontSizeLarge
			}
			background: Rectangle { color: encoderQA["right"].value < 0.9 ? "red" : "green"; width: parent.width; height: parent.height }
		}

        Switch {
            text: "ENCODER INV"
            height: 150
            width: 300
            checked: Boolean(pedalState["invert_enc"])
            onToggled: {
                knobs.set_enc_invert(!pedalState["invert_enc"]);
            }
            font {
                pixelSize: 24
                capitalization: Font.AllUppercase
                family: mainFont.name
            }
            Material.foreground: Constants.rainbow[0]

        }

		Label {
			width: 400
			height: 150
			text: "a "+footSwitchQA["a"].value 
			font {
				pixelSize: fontSizeLarge
			}
			background: Rectangle { color: footSwitchQA["a"].value < 0.9 ? "red" : "green"; width: parent.width; height: parent.height }
		}
		Label {
			width: 400
			height: 150
			text: "b "+footSwitchQA["b"].value 
			font {
				pixelSize: fontSizeLarge
			}
			background: Rectangle { color: footSwitchQA["b"].value < 0.9 ? "red" : "green"; width: parent.width; height: parent.height }
		}
		Label {
			width: 400
			height: 150
			text: "c "+footSwitchQA["c"].value 
			font {
				pixelSize: fontSizeLarge
			}
			background: Rectangle { color: footSwitchQA["c"].value < 0.9 ? "red" : "green"; width: parent.width; height: parent.height }
		}
		Button {
			width: 400
			height: 200
			text: "Load test preset"
			onClicked: {
				knobs.ui_load_qa_preset_by_name("file:///mnt/presets/beebo/Quad_delay.ingen")
			}
		}
		Label {
			width: 200
			height: 200
			text: currentPreset.name
			font {
				pixelSize: fontSizeLarge
			}
		}


		// Button {
		// 	width: 300
		// 	height: 200
		// 	text: currentPedalModel.name == "beebo" ? "Change to Digit" : "Change to Beebo"
		// 	font.pixelSize: fontSizeLarge
		// 	// show screen explaining to put USB flash drive in
		// 	onClicked: {
		// 		if(currentPedalModel.name == "beebo"){
		// 			knobs.set_pedal_model("digit");
		// 		} else {
		// 			knobs.set_pedal_model("beebo");
		// 		}
		// 	}

		// }

		Button {
			width: 250
            height: 200
			text: "IP: " + currentIP.name.replace(/ /g, "\n")
			font.pixelSize: 20
            // Component.onCompleted: contentItem.wrapMode = Text.WordWrap
			// show screen explaining to put USB flash drive in
			onClicked: {
                knobs.get_ip();
			}

		}

	}


	// text: currentBPM.value.toFixed(0) // + " BPM"

	IconButton {
		x: 14 
		y: 646
		icon.width: 15
		icon.height: 25
		width: 62
		height: 62
		flat: false
		icon.name: "back"
		Material.background: "white"
		Material.foreground: Constants.outline_color
		onClicked: mainStack.pop()
	}
}
