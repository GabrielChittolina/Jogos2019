package;

import flixel.FlxObject;

class Correio extends FlxObject{

    var _fila:Array<Mensagem> = [];

    override public function update(elapsed:Float):Void{
        for(m in _fila){
            m.to.onMessage(m);
            _fila.remove(m);
        }
        super.update(elapsed);
    }

    public function send(m:Mensagem):Void{
        _fila.push(m);
    }
}