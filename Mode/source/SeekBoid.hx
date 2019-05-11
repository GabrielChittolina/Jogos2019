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
		dv.normalize().scale(5000);

		seek.x = dv.x + (-acceleration.x);
		seek.y = dv.y + (-acceleration.y);
		seek.normalize().scale(2900);

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

		if (this.x < 0 || this.x + this.width > FlxG.width)
			this.velocity.x *= -1;
		if (this.y < 0 || this.y + this.height > FlxG.height)
			this.velocity.y *= -1;

		super.update(elapsed);
	}
}
