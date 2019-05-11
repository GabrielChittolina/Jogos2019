import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MeuMenuState extends FlxState {
    var _titulo:FlxText;
    var _btnPlay:FlxButton;
    var _btnCreditos:FlxButton;
    override public function create():Void {
        _titulo = new FlxText(0, 0, 0, "André W destroys the world!", 15);
        _titulo.x = FlxG.width/2 - _titulo.width/2;
        _titulo.y = FlxG.height/2 - _titulo.height/2 - 15;

        _btnPlay = new FlxButton(0,0, "Play!", goPlay);
        _btnPlay.x = FlxG.width/2 - _btnPlay.width/2;
        _btnPlay.y = _titulo.y + _titulo.height + 5;

        _btnCreditos = new FlxButton(0, _btnPlay.y + _btnPlay.height + 5, "Créditos", goCreditos);
        _btnCreditos.x = FlxG.width/2 - _btnCreditos.width/2;

        add(_btnCreditos);
        add(_titulo);
        add(_btnPlay);
        super.create();

        //FlxG.fullscreen = true;
    }

    function goCreditos():Void{
        FlxG.switchState(new CreditsState());
    }

    function goPlay():Void{
        FlxG.switchState(new PlayState());
    }

    override public function update(elapsed:Float):Void {

        super.update(elapsed);
    }
}