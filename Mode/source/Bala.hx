package;

import flixel.FlxG;
import flixel.FlxSprite;

class Bala extends FlxSprite {
    public function new() {
        super();
        this.makeGraphic(5, 5, FlxG.random.color(null, null, 0xff));
    }
    
    override public function update(elapsed:Float):Void {
        if(!this.isOnScreen()) {
            this.kill();
        }
        super.update(elapsed);
    }

}