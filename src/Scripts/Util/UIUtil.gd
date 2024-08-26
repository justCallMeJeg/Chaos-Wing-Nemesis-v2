extends Node

var ShipIcons = {
	"CONSTRUCTOR": preload("res://src/Assets/UI/ShipIcons/CONSTRUCTOR.png"),
	"FACON": preload("res://src/Assets/UI/ShipIcons/FALCON.png"),
	"HAVOC": preload("res://src/Assets/UI/ShipIcons/HAVOC.png"),
	"HAWKEYE": preload("res://src/Assets/UI/ShipIcons/HAWKEYE.png"),
	"JUGGERNAUT": preload("res://src/Assets/UI/ShipIcons/JUGGERNAUT.png"),
	"MACHINIST": preload("res://src/Assets/UI/ShipIcons/MACHINIST.png"),
	"PHANTOM": preload("res://src/Assets/UI/ShipIcons/PHANTOM.png"),
	"RAZOR": preload("res://src/Assets/UI/ShipIcons/RAZOR.png")
}

var Text = {
	"SelectionScene": {
		"TextTextureUI": {
			"SideSelection": {
				"UpperText": "TOP\nSIDE\nTOP\nSIDE\nTOP\nSIDE\nTOP\nSIDE",
				"LowerText": "BOTTOM\nSIDE\nBOTTOM\nSIDE\nBOTTOM\nSIDE\nBOTTOM\nSIDE",
			},
			"ShipSelection": {
				"P1Text": "PLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1\nPLAYER 1",
				"P2Text": "PLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2\nPLAYER 2"
			}
		},
		"SideBorderUI": {
			"SideSelection": {
				"LeftBorder": "P1 SELECT A SIDE!",
				"RightBorder": "P2 SELECT A SIDE!"
			},
			"ShipSelection": {
				"LeftBorder": "P1 SELECT A SHIP!",
				"RightBorder": "P2 SELECT A SHIP!"
			},
			"SceneSelection": {
				"P1Select": "P1 SELECT A SCENE!",
				"P2Select": "P2 SELECT A SCENE!"
			}
		},
		"SideTooltipUI": {
			"SideSelection": {
				"P1TooltipText": "PRESS [W] and [S] TO MOVE UP AND DOWN\nPRESS [SPACEBAR] TO CONFIRM",
				"P2TooltipText": "PRESS [↑] and [↓] TO MOVE UP AND DOWN\nPRESS [ENTER] TO CONFIRM",
				"P1IdleText": "WAITING FOR PLAYER 2...\nPRESS [SPACEBAR] TO CANCEL",
				"P2IdleText": "WAITING FOR PLAYER 1...\nPRESS [ENTER] TO CANCEL",
				"IdleText": "PLEASE WAIT..."
			},
			"ShipSelection": {
				"P1TooltipText": "PRESS [A] and [D] TO MOVE LEFT AND RIGHT\nPRESS [SPACEBAR] TO CONFIRM",
				"P2TooltipText": "PRESS [←] and [→] TO MOVE LEFT AND RIGHT\nPRESS [ENTER] TO CONFIRM",
				"P1IdleText": "WAITING FOR PLAYER 2...",
				"P2IdleText": "WAITING FOR PLAYER 1...",
				"IdleText": "PLEASE WAIT..."
			}
		},
		"MainTextUI": {
			"SideSelectionion": {
				"UpperText": "SELECT YOUR SIDE",
				"CenterText": "SIDE SELECTION",
				"CenterIdleText": "SELECT YOUR SIDE",
				"LowerText": "SELECT YOUR SIDE",
				"ErrorText": "SIDE IS ALREADY TAKEN"
			},
			"ShipSelectionion": {
				"UpperText": "SELECT YOUR SHIP",
				"CenterText": "SHIP SELECTION",
				"CenterIdleText": "SELECT YOUR SHIP",
				"LowerText": "SELECT YOUR SHIP"
			},
			"SceneSelection": {
				"CenterText": "SCENE SELECTION",
				"P1Selector": "P1 SELECT A SCENE",
				"P2Selector": "P2 SELECT A SCENE"
			}
		}
	}
}
