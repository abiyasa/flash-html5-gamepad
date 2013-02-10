package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.external.ExternalInterface;
	import flashgamepad.FlashGamePad;
	
	/**
	 * Simple gamepad.js tester
	 * @author Abiyasa
	 */
	public class Main extends Sprite
	{
		private var _textInput:TextField;
		private var _message:String;
		private var _gamepad:FlashGamePad;
		
		public function Main():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			const MARGIN:int = 10;
			
			var textformat:TextFormat = new TextFormat();
			textformat.font = 'Verdana';
			textformat.color = 0x666666;
			textformat.leftMargin = 2;
			textformat.rightMargin = 2;
			
			// show text displayer
			_textInput = new TextField();
			_textInput.border = true;
			_textInput.borderColor = 0xcccccc;
			_textInput.defaultTextFormat = textformat;
			_textInput.x = MARGIN;
			_textInput.y = MARGIN;
			_textInput.width = this.stage.stageWidth - (2 * MARGIN);
			_textInput.height = this.stage.stageHeight - (2 * MARGIN);
			_textInput.selectable = false;
			_textInput.wordWrap = true;
			
			this.addChild(_textInput);
			
			_message = 'dummy text';
			
			if (!FlashGamePad.available)
			{
				_message = 'FLash GamePad API is NOT available. Cannot test game pad';
				_textInput.text = _message;
				return;
			}
			
			// init gamepad
			_gamepad = new FlashGamePad();
			var result:Boolean = _gamepad.init();
			if (!result)
			{
				_message = 'Failed to init gamepad';
				_textInput.text = _message;
				return;
			}
			
			startPooling();
		}

		private function startPooling():void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			// update gamepad & get status
			var poolResult:Object = ExternalInterface.call('FlashGamePad.update');
			if (poolResult == null)
			{
				// failed to ge input
				_message = 'Gamepad is not detected. Try to press any gamepad\'s button';
			}
			else
			{
				// show result
				var resultStr:String = '';
				for each (var gamepadStatus:Object in poolResult)
				{
					resultStr += 'gamepad=' + gamepadStatus.type + '\n';
					for (var control:Object in gamepadStatus)
					{
						resultStr += '  ' + control + '=' + gamepadStatus[control] + '\n';
					}
				}
				_message = resultStr;
			}
			
			// show
			_textInput.text = _message;
		}
		
	}
	
}
