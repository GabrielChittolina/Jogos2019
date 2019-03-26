package;

import flixel.FlxG;

class Inimigo extends Entidade{
    override public function onMessage(m:Mensagem):Void{
        FlxG.log.add("Inimigo msg, op = " + m.op);
    }
}