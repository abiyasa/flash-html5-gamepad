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
	
	// only 1 gamepad instance allowed
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

FlashGamePad.poolStatus = function () {
	console.log('poolStatus()=', FlashGamePad._isConnected);
	
	return FlashGamePad._isConnected;
}