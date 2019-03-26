import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class CreditsState extends FlxState {

    var _textoCreditos:FlxText;
    var _textoProg:FlxText;
    var _contentProg:FlxText;
    var _textoArte:FlxText;
    var _contentArte:FlxText;
    var _textoResto:FlxText;
    var _contentResto:FlxText;
    var _btnReturn:FlxButton;

    override public function create():Void {
        _textoCreditos = new FlxText(0, 0, 0, "Créditos", 20);
        _textoCreditos.x = FlxG.width/2 - _textoCreditos.width/2;
        _textoCreditos.y = FlxG.height;
        _textoCreditos.alignment = CENTER;
        _textoCreditos.moves = true;
        _textoCreditos.velocity.y = -25;

        _textoProg = new FlxText(0, 0, 0, "", 15);
        _textoProg.color = 0x00FF0000;
        _textoProg.text = "[PROGRAMAÇÃO]";
        _textoProg.x = FlxG.width/2 - _textoProg.width/2;
        _textoProg.y = _textoCreditos.y + _textoCreditos.height + 10;
        _textoProg.alignment = CENTER;
        _textoProg.moves = true;
        _textoProg.velocity.y = -25;

        _contentProg = new FlxText(0, 0, 0, "", 12);
        _contentProg.text = "Eu";
        _contentProg.x = FlxG.width/2 - _contentProg.width/2;
        _contentProg.y = _textoProg.y + _textoProg.height;
        _contentProg.alignment = CENTER;
        _contentProg.moves = true;
        _contentProg.velocity.y = -25;

        _textoArte = new FlxText(0, 0, 0, "", 15);
        _textoArte.color = 0x0000FF00;
        _textoArte.text = "[ARTE]";
        _textoArte.x = FlxG.width/2 - _textoArte.width/2;
        _textoArte.y = _contentProg.y + _contentProg.height + 5;
        _textoArte.alignment = CENTER;
        _textoArte.moves = true;
        _textoArte.velocity.y = -25;

        _contentArte = new FlxText(0, 0, 0, "", 12);
        _contentArte.text = "Eu";
        _contentArte.x = FlxG.width/2 - _contentArte.width/2;
        _contentArte.y = _textoArte.y + _textoArte.height;
        _contentArte.alignment = CENTER;
        _contentArte.moves = true;
        _contentArte.velocity.y = -25;

        _textoResto = new FlxText(0, 0, 0, "", 15);
        _textoResto.color = 0x00FF00FF;
        _textoResto.text = "[TODO O RESTO]";
        _textoResto.x = FlxG.width/2 - _textoResto.width/2;
        _textoResto.y = _contentArte.y + _contentArte.height + 5;
        _textoResto.alignment = CENTER;
        _textoResto.moves = true;
        _textoResto.velocity.y = -25;

        _contentResto = new FlxText(0, 0, 0, "", 12);
        _contentResto.text = "Olha só\nEU TAMBÉM!\n\n\n\nAliás, valeu HaxeFlixel :)";
        _contentResto.x = FlxG.width/2 - _contentResto.width/2;
        _contentResto.y = _textoResto.y + _textoArte.height;
        _contentResto.alignment = CENTER;
        _contentResto.moves = true;
        _contentResto.velocity.y = -25;

        _btnReturn = new FlxButton(0,0, "Back!", goReturn);
        _btnReturn.x = 5 * (FlxG.width/6) - _btnReturn.width/2;
        _btnReturn.y = 5 * (FlxG.height/6);

        add(_contentResto);
        add(_textoResto);
        add(_contentArte);
        add(_textoArte);
        add(_contentProg);
        add(_textoProg);
        add(_textoCreditos);
        add(_btnReturn);
        super.create();

        //FlxG.fullscreen = true;
    }

    function goReturn():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void {

        super.update(elapsed);
    }
}