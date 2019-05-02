package;

import flixel.math.FlxMath;
import flixel.math.FlxVector;
import flixel.FlxSprite;
import flixel.FlxG;

class Boid extends FlxSprite {
    var _contador:Float;
    var _pilhaIA:Array<String>;

    public function new() {
        super(100, 100);
        _contador = 0;
        _pilhaIA = ["vagando"];
    }

    function getEstadoAtual():String {
        if (_pilhaIA.length <= 0) {
            return "vagando";
        }
        return _pilhaIA[_pilhaIA.length - 1];
    }

    function empilhaEstado(e:String):Void {
        if (getEstadoAtual() == e) {
            return;
        }
        _pilhaIA.push(e);
    }

    function trocaDirecao():Void {
        var a:FlxVector = new FlxVector();
        a.x = FlxG.mouse.x - this.x;
        a.y = FlxG.mouse.y - this.y;
        a.normalize().scale(100);
        velocity.x = a.x;
        velocity.y = a.y;
    }

    function vaga(elapsed:Float):Void {
        if (FlxMath.distanceToMouse(this) < 50) {
            empilhaEstado("fugindo");
            return;
        }

        _contador += elapsed;
        if (_contador >= 5) {
            _contador = 0;
            trocaDirecao();
        }
    }

    function foge():Void {
        var v:FlxVector = new FlxVector();
        v.x = this.x - FlxG.mouse.x;
        v.y = this.y - FlxG.mouse.y;
        v.normalize().scale(50);
        velocity.x = v.x;
        velocity.y = v.y;

        if (FlxMath.distanceToMouse(this) >= 100) {
            _pilhaIA.pop();
        }

        if (FlxMath.distanceToMouse(this) <= 5) {
            empilhaEstado("correndo");
        }
    }

    function corre():Void {
        var v:FlxVector = new FlxVector();
        v.x = -this.x;
        v.y = -this.y;
        v.normalize().scale(50);
        velocity.x = v.x;
        velocity.y = v.y;

        if (FlxMath.distanceToMouse(this) >= 50) {
            _pilhaIA.pop();
        }
    }

    override public function update(elapsed:Float):Void {
        var estado = getEstadoAtual();
        
        if (estado == "vagando") {
            vaga(elapsed);
        } else if (estado == "fugindo") {
            foge();
        } else if (estado == "correndo") {
            corre();
        }

        super.update(elapsed);
    }
}