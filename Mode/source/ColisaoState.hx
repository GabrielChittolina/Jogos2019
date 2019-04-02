package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class ColisaoState extends FlxState {
    var _jogador:FlxSprite;
    var _tiro:FlxSprite;

    override public function create():Void {
        _jogador = new FlxSprite(50, 50);
        _tiro = new FlxSprite(100, 70);
        
        _jogador.angularVelocity = 50;

        add(_tiro);
        add(_jogador);
        super.create();
    }

    function onOverlap(a:FlxSprite, b:FlxSprite):Void {
        FlxG.log.add("OVERLAP");
        b.kill();
        a.angularVelocity = 100;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(FlxG.keys.pressed.RIGHT) _jogador.x += 1;
        if(FlxG.keys.pressed.LEFT) _jogador.x -= 1;
        if(FlxG.keys.pressed.UP) _jogador.y -= 1;
        if(FlxG.keys.pressed.DOWN) _jogador.y += 1;

        //FlxG.overlap(_jogador, _tiro, onOverlap);
        //var overlapping = FlxG.pixelPerfectOverlap(_jogador, _tiro);
        //if(overlapping) _jogador.kill();
        
        FlxG.collide(_jogador, _tiro);
    }
}