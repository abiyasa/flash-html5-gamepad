package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.external.ExternalInterface;
	
	/**
	 * Simple gamepad.js tester
	 * @author Abiyasa
	 */
	public class Main extends Sprite
	{
		private var _textInput:TextField;
		private var _message:String;
		
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
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			testExternalInterface();
		}
		
		private function testExternalInterface():void
		{
			if (!ExternalInterface.available)
			{
				_message = 'External interface is NOT avaible. Cannot test game pad';
			}
		}
		
		private function onEnterFrame(event:Event):void
		{
			// TODO gameinput polling
			
			// TODO update message
			
			// show
			_textInput.text = _message;
		}
		
	}
	
}
