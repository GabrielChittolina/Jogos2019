package;

import flixel.FlxSprite;

class Retangulo extends FlxSprite {
    public function new(w:Int, h:Int, c:Int){
        super();
        this.makeGraphic(w, h, c);
        this.health = 10;
    }
}