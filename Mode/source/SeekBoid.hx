package;

import flixel.math.FlxMath;
import flixel.math.FlxVector;
import flixel.FlxSprite;
import flixel.FlxG;

class SeekBoid extends FlxSprite {
    var _contador:Float;
    var _pilhaIA:Array<String>;

    public function new() {
        super(100, 100);
        this.velocity.x = 200;
        this.velocity.y = 200;
        this.maxVelocity.x = 500;
        this.maxVelocity.y = 500;
        _contador = 0;
        _pilhaIA = ["seeking"];
    }

    function getEstadoAtual():String {
        if (_pilhaIA.length <= 0) {
            return "seeking";
        }
        return _pilhaIA[_pilhaIA.length - 1];
    }

    function empilhaEstado(e:String):Void {
        if (getEstadoAtual() == e) {
            return;
        }
        _pilhaIA.push(e);
    }

    function seek(elapsed:Float):Void {
        var seek:FlxVector = new FlxVector();
        var dv:FlxVector = new FlxVector();
        
        dv.x = FlxG.mouse.x - this.x;
        dv.y = FlxG.mouse.y - this.y;
        dv.normalize().scale(120);
        
        seek.x = dv.x + (-velocity.x);
        seek.y = dv.y + (-velocity.y);
        seek.normalize().scale(100);

        acceleration.x = seek.x;
        acceleration.y = seek.y;
    }

    function trocaDirecao():Void {
        var a:FlxVector = new FlxVector();
        a.x = FlxG.mouse.x - this.x;
        a.y = FlxG.mouse.y - this.y;
        a.normalize().scale(50);
        velocity.x = a.x;
        velocity.y = a.y;
    }

    override public function update(elapsed:Float):Void {
        var estado = getEstadoAtual();
        
        seek(elapsed);

        super.update(elapsed);
    }
}