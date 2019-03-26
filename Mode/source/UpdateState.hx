package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

class UpdateState extends FlxState{

    var _sprite:FlxSprite;
    var _bullet:FlxSprite;
    var _HUD:HUD;
    var a:Int;
    var b:Int;

    override public function create():Void{
        _sprite = new FlxSprite();
        _bullet = new FlxSprite();
        _HUD = new HUD();
        _bullet.makeGraphic(5,5, 0xffff0000);
        _bullet.kill();
        a = 1;
        b = 1;
        //_sprite.loadGraphic("assets/images/dvd.png");
        //_sprite.scale.set(0.5, 0.5);
        add(_bullet);
        add(_sprite);
        add(_HUD);
        super.create();
    }

    override public function update(elapsed:Float){
        /*_sprite.x += a;
        _sprite.y += b;

        if(_sprite.x + _sprite.width >= FlxG.width){
            a = -1;
        }else if(_sprite.x <= 0){
            a = 1;
        }

        if(_sprite.y + _sprite.height >= FlxG.height){
            b = -1;
        }else if(_sprite.y <= 0){
            b = 1;
        }*/

        _sprite.setColorTransform(1,1,1,1,15,10,10,1);

        if(FlxG.keys.pressed.UP){
            _sprite.y -= 1;
        }

        if(FlxG.keys.pressed.DOWN){
            _sprite.y += 1;
        }

        if(FlxG.keys.pressed.LEFT){
            _sprite.x -= 1;
        }

        if(FlxG.keys.pressed.RIGHT){
            _sprite.x += 1;
        }

        if(FlxG.keys.pressed.SPACE){
            _bullet.reset(_sprite.x, _sprite.y);
        }

        if(_bullet.alive){
            _bullet.x += 10;
            if(_bullet.isOnScreen() == false){
                _bullet.kill();
            }
        }

        super.update(elapsed);
    }
}