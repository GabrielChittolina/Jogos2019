package;

import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.FlxG;

class Boid extends FlxSprite {
    var _state:String;
    var _timer:Float;
    public function new(w:Int, h:Int, c:Int) {
        super();
        this.makeGraphic(w, h, c);
        _state = "vagando";
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        _timer += elapsed;
        if(_state == "vagando" && FlxMath.distanceToMouse(this) < 10) {
            _state = "correrParaOrigem";
            FlxG.log.add("correrParaOrigem");
        } else if(_state == "correrParaOrigem" && this.x <= 10 && this.y <= 10) {
            _state = "parado";
            FlxG.log.add("parado");
        } else if(_state == "parado" && _timer >= 5) {
            _state = "vagando";
            FlxG.log.add("vagando");
            _timer = 0;
        }
    }
}