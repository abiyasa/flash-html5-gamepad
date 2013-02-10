/**
 * Provides functions to be called by the flash application through ExternalInterface
 */
var FlashGamePad = FlashGamePad || { VERSION: '0.1' };

FlashGamePad._gamepad = undefined;
FlashGamePad._isConnected = false;

/**
 * init gamepad object
 */
FlashGamePad.init = function () {
	console.log('init gamepad');
	
	// Note: only 1 gamepad instance allowed this time
	var gamepad = FlashGamePad._gamepad;
	if (!gamepad) {
		gamepad = new Gamepad();
		FlashGamePad._gamepad = gamepad;
	}
	
	// handle event gamepad connected
	gamepad.bind(Gamepad.Event.CONNECTED, function(device) {
		console.log('Connected', device);
		
		// TODO use device.index, device.id, device.type
		FlashGamePad._isConnected = true;
	});
	
	// handle event gamepad disconnected
	gamepad.bind(Gamepad.Event.DISCONNECTED, function(device) {
		console.log('Disconnected', device);
		
		// TODO use device.index, device.id, device.type
		FlashGamePad._isConnected = false;
	});
	
	return FlashGamePad._gamepad.init();
};

/**
 * Check if the game is connected
 */
FlashGamePad.isConnected = function () {
	//console.log('isConnected() = ' + FlashGamePad._isConnected);
	return FlashGamePad._isConnected;
};

/**
 * Update the latest gamepad button status.
 * Make sure that the gamepad is connected.
 * will return the gamepad status (buttons, axis) as an object.
 *
 * return null if the gamepad is not connected
 */
FlashGamePad.update = function () {
	//console.log('update(), connected=', FlashGamePad._isConnected);
	var result = null;
	
	if (FlashGamePad._isConnected) {
		// get the button status
		result = {};
		var gamepads = FlashGamePad._gamepad.gamepads, i, control, gamepadStatus;
		//console.log('there are ' + gamepads.length  + ' gamepad detected');
		for (i = 0; i < gamepads.length; i++) {
			if (typeof(gamepads[i]) == 'undefined') {
				console.log('gamepad-' + i + ' is undefined');
				continue;
			}
			
			gamepadStatus = {};
			for (control in gamepads[i].state) {
				gamepadStatus[control] = gamepads[i].state[control];
			}
			result['pad-' + i] = gamepadStatus;
		}
	}
	
	return result;
};
