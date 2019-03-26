package;

import flixel.FlxG;
import flixel.FlxSprite;

class Entidade extends FlxSprite{
    public function onMessage(m:Mensagem):Void{
        FlxG.log.add("Msg Recebida. Op = " + m.op);
    }
}