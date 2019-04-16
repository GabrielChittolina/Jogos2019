package;

import flixel.math.FlxPoint;
import flixel.util.FlxPath;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class CaminhoState extends FlxState {
    var _sprite:FlxSprite;
    var _squareWay:Array<FlxPoint>;
    var _xWay:Array<FlxPoint>;
    var _yourWay:Array<FlxPoint>;

    override public function create():Void {
        _sprite = new FlxSprite();
        _yourWay = [];

        _squareWay = [
            new FlxPoint(10, 10),
            new FlxPoint(FlxG.width - 10, 10),
            new FlxPoint(FlxG.width - 10, FlxG.height-10),
            new FlxPoint(10, FlxG.height-10)
        ];

        _xWay = [
            new FlxPoint(10, 10),
            new FlxPoint(FlxG.width - 10, FlxG.height-10),
            new FlxPoint(FlxG.width - 10, 10),
            new FlxPoint(10, FlxG.height-10)
        ];

        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        if(FlxG.keys.justPressed.A){
            _sprite.path = new FlxPath().start(
                _xWay,
                130,
                FlxPath.LOOP_FORWARD
            );
        }
        
        if(FlxG.keys.justPressed.P){
            _sprite.path = new FlxPath().start(
                _squareWay,
                130,
                FlxPath.LOOP_BACKWARD
            );
        }

        if(FlxG.mouse.justPressed) {
            if(_yourWay.length < 20){
                _yourWay.push(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
            } else {
                _sprite.path = new FlxPath().start(
                    _yourWay,
                    130,
                    FlxPath.LOOP_FORWARD
                );
            }
        }
        super.update(elapsed);
    }
}