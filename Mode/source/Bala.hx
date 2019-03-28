package;

class Bala extends FlxSprite {
    public function new() {
        super();
        this.makeGraphic(5, 5, 0xffff0000);
    }
    
    override public function update(elapsed:Float):Void {
        if(!this.isOnScreen()) {
            this.kill();
        }
        super.update(elapsed);
    }

}