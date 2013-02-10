package flashgamepad
{
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	/**
	 * Simple gamepad.js tester
	 * @author Abiyasa
	 */
	public class FlashGamePad
	{
		public static const TYPE_PLAYSTATION:String = 'playstation';
		public static const TYPE_LOGITECH:String = 'logitech';
		public static const TYPE_XBOX:String = 'xbox';
		public static const TYPE_UNSUPPORTED:String = 'unsupported';
		
		public static const BUTTON_A:String = 'A';
		public static const BUTTON_B:String = 'B';
		public static const BUTTON_X:String = 'X';
		public static const BUTTON_Y:String = 'Y';
		public static const BUTTON_LB:String = 'LB';
		public static const BUTTON_RB:String = 'RB';
		public static const BUTTON_LEFT_TRIGGER:String = 'LEFT_TRIGGER';
		public static const BUTTON_RIGHT_TRIGGER:String = 'RIGHT_TRIGGER';
		public static const BUTTON_LEFT_STICK:String = 'LEFT_STICK';
		public static const BUTTON_RIGHT_STICK:String = 'RIGHT_STICK';
		public static const BUTTON_START:String = 'START';
		public static const BUTTON_BACK:String = 'BACK';
		public static const BUTTON_DPAD_UP:String = 'DPAD_UP';
		public static const BUTTON_DPAD_DOWN:String = 'DPAD_DOWN';
		public static const BUTTON_DPAD_LEFT:String = 'DPAD_LEFT';
		public static const BUTTON_DPAD_RIGHT:String = 'DPAD_RIGHT';
		
		public static const AXIS_LEFT_STICK_X:String = 'LEFT_STICK_X';
		public static const AXIS_LEFT_STICK_Y:String = 'LEFT_STICK_Y';
		public static const AXIS_RIGHT_STICK_X:String = 'RIGHT_STICK_X';
		public static const AXIS_RIGHT_STICK_Y:String = 'RIGHT_STICK_Y';
		
		public function FlashGamePad()
		{
		}
		
		/**
		 * Checks if the gamepad API is available for access.
		 *
		 * @return
		 */
		public static function get available():Boolean
		{
			return (ExternalInterface.available);
		}
		
		/**
		 * Initialize the game pad before starts using
		 * @return true if gamepad API is being initiated.
		 * false means something is wrong
		 */
		public function init():Boolean
		{
			var result:Boolean;
			try
			{
				result = Boolean(ExternalInterface.call('FlashGamePad.init'));
			}
			catch (e:Error)
			{
				result = false;
			}
			return result;
		}
		
		/**
		 * Gets the gamepad status.
		 *
		 * @return the gamepad object
		 */
		public function getStatus():Object
		{
			// update gamepad & get the gamepad status
			var result:Object = ExternalInterface.call('FlashGamePad.update');
			return result;
		}
		
	}
	
}
