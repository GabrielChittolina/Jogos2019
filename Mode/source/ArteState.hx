// https://opengameart.org/content/tiny-16-expanded-character-sprites
package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class ArteState extends FlxState {
    var _sprite:FlxSprite;

    override public function create():Void {
        _sprite = new FlxSprite();

        _sprite.loadGraphic(AssetPaths.nudeman__png, true, 16);
        _sprite.setFacingFlip(FlxObject.LEFT, true, false);
        _sprite.setFacingFlip(FlxObject.RIGHT, false, false);

        _sprite.animation.add("walkD", [0, 1, 2, 3, 4], 8);
        _sprite.animation.add("walkU", [0, 3, 2, 4], 8);
        _sprite.animation.add("walkR", [0, 3, 2, 4], 8);
        _sprite.animation.add("walkL", [0, 3, 2, 4], 8);
        _sprite.animation.add("idleD", [1], 8);

        

        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        
        if(FlxG.keys.pressed.RIGHT) {
            _sprite.x += 0.5;
        }

        if(FlxG.keys.pressed.LEFT) {
            _sprite.x -= 0.5;
        }

        if(FlxG.keys.pressed.DOWN) {
            _sprite.animation.play("walkD");
            _sprite.y += 0.5;
            
        }

        if(FlxG.keys.pressed.UP) {
            _sprite.y -= 0.5;
        }

        if(FlxG.keys.anyJustReleased([LEFT, RIGHT, UP, DOWN])) {
            _sprite.animation.play("idleD");
        }

        super.update(elapsed);
    }
}