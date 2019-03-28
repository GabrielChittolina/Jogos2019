package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxVector;

class MatematicaState extends FlxState {
    var _cannon:Canhao;
    var _velocity:FlxVector = new FlxVector();
    var _balas:FlxTypedGroup<Bala>;
    var _retInimigo:Retangulo;
    var _correio:Correio;
    var _hud:HUD;

    override public function create():Void {
        _correio = new Correio();
        _balas = new FlxTypedGroup<Bala>();
        _cannon = new Canhao();
        _retInimigo = new Retangulo(30, 15, 0xffffffff);
        _hud = new HUD();

        for(i in 0...30) {
            var s:Bala = new Bala();
            s.angularAcceleration = 100;
            s.kill();
            _balas.add(s);
        }

        _cannon.x = FlxG.width / 2 - _cannon.width / 2;
        _cannon.y = FlxG.height - _cannon.height + 2;

        add(_balas);
        add(_cannon);
        add(_retInimigo);
        add(_correio);
        add(_hud);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        if(FlxG.mouse.justPressed) {
            var b = _balas.getFirstAvailable();
            _velocity.x = FlxG.mouse.x - _cannon.x;
            _velocity.y = FlxG.mouse.y - _cannon.y;
            _velocity.normalize();
            _velocity.scale(200);
            if(b != null) {
                b.reset(_cannon.x + (_cannon.width - b.width) / 2, _cannon.y);
                b.velocity.x = _velocity.x;
                b.velocity.y = _velocity.y;
            }
        }

        super.update(elapsed);
    }
}