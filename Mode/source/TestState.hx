import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class TestState extends FlxState {
    var _logo:FlxSprite;
    var _shoot:FlxSprite;
    var _target:FlxSprite;
    var _text:FlxText;

    override public function create():Void {
        _logo = new FlxSprite();
        _logo.makeGraphic(40, 40, 0xffff0000);
        _logo.velocity.x = 400;
        _logo.velocity.y = 400;
        _logo.angle = 40;
        _logo.angularVelocity = 100;

        _target = new FlxSprite();
        _target.makeGraphic(40, 40, 0xffeeccee);
        _target.velocity.x = 100;
        _target.velocity.y = 100;
        _target.x = 90;
        _target.y = 59;
        _target.angle = 40;
        _target.angularVelocity = 500;
        
        _text = new FlxText();
        _text.text = 'EAE MEN';
        _text.x = 180;
        _text.y = 120;
        _text.angle = 40;

        add(_logo);
        add(_target);
        add(_text);
        super.create();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        if(_logo.x + _logo.width > 900 || _logo.x < 0){
            _logo.velocity.x = - _logo.velocity.x;
        }
        if(_logo.y + _logo.width > 1024 || _logo.y < 0){
            _logo.velocity.y = - _logo.velocity.y;
        }

        if(_target.x + _target.width > 1024 || _target.x < 0){
            _target.velocity.x = - _target.velocity.x;
        }
        if(_target.y + _target.width > 1024 || _target.y < 0){
            _target.velocity.y = - _target.velocity.y;
        }

        _text.angle++;
    }
}