package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;

class EntradaState extends FlxState {
    var _balas:FlxTypedGroup<FlxSprite>;
    var _player1:FlxSprite;
    var _player2:FlxSprite;

    override public function create():Void {
        _balas = new FlxTypedGroup<FlxSprite>();
        _player1 = new FlxSprite();
        _player2 = new FlxSprite();

        _player1.makeGraphic(100, 15);
        _player1.x = FlxG.width / 2;

        _player2.makeGraphic(100, 15, 0xff0000ff);

        for(i in 0...500) {
            var s = new FlxSprite();
            s.angularAcceleration = 100;
            s.kill();
            _balas.add(s);
        }

        add(_balas);
        add(_player1);
        // add(_player2);
        super.create();
    }
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(FlxG.mouse.pressed) {
            var s = _balas.getFirstAvailable();
            if(s != null) {
                s.reset(FlxG.mouse.x, FlxG.mouse.y);
            }
        }
    }
}