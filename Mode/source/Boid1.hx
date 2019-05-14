package;

import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.FlxSprite;
import flixel.FlxG;

class Boid1 extends FlxSprite {
    public function new() {
        super(FlxG.width / 2, FlxG.height / 2);
        velocity.set(10, 10);
    }

    public function seek(x:Int, y:Int):FlxVector {
        var target = new FlxVector(x, y);
        var seek = target.subtractPoint(new FlxVector(this.x, this.y));
        seek.normalize().scale(50);

        return seek;
    }

    public function flee(x:Int, y:Int):FlxVector {
        return seek(x, y).scale(-0.75);
    }

    public function arrive(x:Int, y:Int, radio:Float):FlxVector {
        var target = new FlxVector(x, y);
        var arrive = target.subtractPoint(new FlxVector(this.x, this.y));

        if (arrive.length <= radio) {
            return new FlxVector(velocity.x, velocity.y).normalize().scale(-27);
        }
        return new FlxVector();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        var steering = new FlxVector();
        // steering.addPoint(flee(FlxG.mouse.x, FlxG.mouse.y));
        // steering.addPoint(seek(FlxG.width, FlxG.height));
        steering.addPoint(seek(FlxG.mouse.x, FlxG.mouse.y));
        // steering.addPoint(arrive(FlxG.mouse.x, FlxG.mouse.y, 50));
        acceleration.set(steering.x, steering.y);

        if (this.x < 0 || this.x + this.width > FlxG.width)
			this.velocity.x *= -1;
		if (this.y < 0 || this.y + this.height > FlxG.height)
			this.velocity.y *= -1;
    }
}