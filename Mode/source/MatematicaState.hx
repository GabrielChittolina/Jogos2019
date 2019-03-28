package;

import flixel.*;
import flixel.math.FlxVector;

class MatematicaState extends FlxState {
    var _cannon:FlxSprite;
    var _velocity:FlxVector = new FlxVector();
    var _balas:FlxTypedGroup<Bala>;

    override public function create():Void {
        _balas = new FlxTypedGroup<Bala>();
        _cannon = new FlxSprite(FlxG.width / 2, FlxG.height - 16);


        add(_cannon);
        add(_balas);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        _player.x += _velocity.x;
        _player.y += _velocity.y;

        if(FlxG.mouse.pressed) {
            var b = new FlxSprite(_cannon.x, _cannon.y);
            b.makeGraphic(10, 10, 0xffff0000);
            _velocity.x = FlxG.mouse.x - _cannon.x;
            _velocity.y = FlxG.mouse.y - _cannon.y;
            _velocity.normalize();
            _velocity.scale(200);
            b.velocity.x = _velocity.x;
            b.velocity.y = _velocity.y;
            add(b);
        }

        super.update(elapsed);
    }
}