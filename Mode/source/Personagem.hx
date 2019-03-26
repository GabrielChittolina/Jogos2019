package;

import flixel.FlxG;

class Personagem extends Entidade{

    public function new(){
        super();
        health = 10;
    }

    override public function onMessage(m:Mensagem):Void{
        FlxG.log.add("Personagem msg, op = " + m.op);
        
        if(m.op == Mensagem.OP_DANO){
            hurt(m.data);
        }
    }
}