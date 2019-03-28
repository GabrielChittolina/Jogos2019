package;

import flixel.FlxG;
import flixel.FlxSprite;

class Canhao extends FlxSprite {
    public function new() {
        super();
        this.makeGraphic(20, 20, 0xff0000ff);
    }

    public function onMessage(m:Mensagem):Void {
        FlxG.log.add("Personagem msg, op = " + m.op);
    }
}