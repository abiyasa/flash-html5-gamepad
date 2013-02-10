# Flash-HTML5-Gamepad

Gamepad API for Flash. This API enables Flash to connect to the HTML5's Gamepad API using
[kallaspriit library](https://github.com/kallaspriit/HTML5-JavaScript-Gamepad-Controller-Library)
and Flash's ExternalInterface.

## Current Status

Still in Alpha and experimental version. Use carefully!
* Works on latest Firefox and Google Chrome.
* So far tested only using XBOX wired gamepad

## How to use

* On `index.html`, include the JavaScript scripts.
```javascript
    <script src="libs/js/gamepad.min.js"></script>
    <script src="libs/js/gamepad-wrapper.js"></script>
```

* On the ActionScript main file, you want to make sure that the GamePad API is accessable.
The Gamepad API only works if you run the Flash application ON the browser.
Running the Flash app using the debugger or FLash projector will not work!
```actionscript
    import flashgamepad.FlashGamePad;

    ...

    if (!FlashGamePad.available)
    {
        trace('Gamepad API is not accessable');
        return;
    }
```

* Create an instance of the Gamepad class & init
```actionscript
    var _gamepad = new Gamepad();
    var success:Boolean = _gamepad.init();
    if (!success)
    {
        trace('Gamepad initiation failed!');
        return;
    }

```

* Call get gamepad status on each frame
```actionscript
    this.addEventListener(Event.ENTER_FRAME, onEnterFrame);

    ...

    private function onEnterFrame(event:Event):void
    {
        // update gamepad & get status
        var poolResult:Object = _gamepad.getStatus();
        if (poolResult == null)
        {
            // failed to get input, might need to press button to trigger
            trace('Gamepad is not detected. Try to press any gamepad\'s button');
        }
        else  // get gamepad status object
        {
            // show gamepad status object
            var resultStr:String = '';
            for each (var gamepadStatus:Object in poolResult)
            {
                resultStr += 'gamepad=' + gamepadStatus.type + '\n';
                for (var control:Object in gamepadStatus)
                {
                    resultStr += '  ' + control + '=' + gamepadStatus[control] + '\n';
                }
            }
            trace(resultStr);
        }
    }

}
```
