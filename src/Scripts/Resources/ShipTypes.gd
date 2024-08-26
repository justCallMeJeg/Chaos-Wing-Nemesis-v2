extends Resource

enum ShipTypes { INTERCEPTOR, BOMBER, SNIPER, ENGINEER }

var ConstructorShipType := {
	"name": "CONSTRUCTOR",
	"type": ShipTypes.ENGINEER,
	"abilities": [
		{
			"name": "Turret Deployment",
			"handler": ""
		}
	],
	"stats": {
		"health": 3,
		"speed": 1
	}
}

var Ships := [
	ConstructorShipType
]
