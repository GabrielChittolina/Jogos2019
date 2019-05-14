package;

import flixel.FlxState;
import flixel.FlxG;

class SteeringState extends FlxState {
    var boid:Boid1;
    override public function create():Void {
        boid = new Boid1();

        add(boid);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }
}