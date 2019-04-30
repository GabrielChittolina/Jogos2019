package;

import flixel.math.FlxMath;
import flixel.FlxState;
import flixel.FlxG;

class IaState extends FlxState {
    var _state:String;
    var _sprite:Boid;
    var _timer:Float;

    override public function create():Void {
        _timer = 0;
        _state = "vagando";
        _sprite = new Boid(10, 10, 0xffffffff);

        _sprite.x = 100;
        _sprite.y = 100;

        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        _timer += elapsed;
        if(_state == "vagando" && FlxMath.distanceToMouse(_sprite) < 10) {
            _state = "correrParaOrigem";
            FlxG.log.add("correrParaOrigem");
        } else if(_state == "correrParaOrigem" && _sprite.x <= 10 && _sprite.y <= 10) {
            _state = "parado";
            FlxG.log.add("parado");
        } else if(_state == "parado" && _timer >= 5) {
            _state = "vagando";
            FlxG.log.add("vagando");
            _timer = 0;
        }
    }
}