package;

import flixel.system.FlxAssets;
import flixel.FlxG;
import flixel.FlxState;

class TesteState extends FlxState{

    var _correio:Correio;
    var _personagem:Personagem;
    var _inimigo:Entidade;

    override public function create():Void{
        _correio = new Correio();
        _personagem = new Personagem();
        _inimigo = new Entidade();

        _personagem.makeGraphic(10, 10, 0xff00ff00);
        _inimigo.makeGraphic(10, 10, 0xffff0000);
        _inimigo.x = 100;

        add(_personagem);
        add(_inimigo);
        add(_correio);

        var m:Mensagem = new Mensagem();
        m.from = _inimigo;
        m.to = _personagem;
        m.op = Mensagem.OP_CURA;
        m.data = 3.14;

        

        super.create();
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.keys.justPressed.SPACE){
            var m:Mensagem = new Mensagem();
            m.from = _inimigo;
            m.to = _personagem;
            m.op = Mensagem.OP_DANO;
            m.data = 3.14;
            _correio.send(m);
            FlxG.sound.play(FlxAssets.getSound("assets/sounds/hit"), 0.5);
        }
        super.update(elapsed);
    }
}