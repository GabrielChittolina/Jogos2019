package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;   

class SpriteState extends FlxState {
    var _sprite:FlxSprite;
    var _sprite1:FlxSprite;

    override public function create():Void {
        _sprite = new FlxSprite(0,0);
        _sprite.velocity.x = 0;
        //_sprite.acceleration.x = 25;
        //_sprite.maxVelocity.x = 100;
        _sprite.health = 10;
        _sprite.scale.x = 100;
        _sprite.scale.y = 0.1;
        _sprite.angularVelocity = 19999999999999999999;
        _sprite.antialiasing = true;
        add(_sprite);
        _sprite1 = new FlxSprite(300,0);
        _sprite1.velocity.x = 0;
        //_sprite1.acceleration.x = 25;
        //_sprite1.maxVelocity.x = 100;
        _sprite1.health = 10;
        _sprite1.scale.x = 100;
        _sprite1.scale.y = 0.1;
        _sprite1.angularVelocity = 19999999999999999999;
        _sprite1.antialiasing = true;
        add(_sprite1);
        super.create();
    }
}