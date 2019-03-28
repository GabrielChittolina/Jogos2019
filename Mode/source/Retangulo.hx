package;

import flixel.FlxG;
import flixel.FlxSprite;

class Retangulo extends FlxSprite {
    public function new(w:Int, h:Int, c:Int){
        super();
        this.makeGraphic(w, h, c);
        this.health = 10;
    }

    public function onMessage(m:Mensagem):Void {
        FlxG.log.add("Personagem msg, op = " + m.op);
    }
}