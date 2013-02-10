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
