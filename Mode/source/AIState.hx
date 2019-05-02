package;

import flixel.*;
import flixel.FlxState;
import flixel.group.FlxGroup;

class AIState extends FlxState {
    var _boids:FlxGroup;

    override public function create():Void {
        super.create();
        _boids = new FlxGroup();
        _boids.add(new Boid());
        add(_boids);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }
}
