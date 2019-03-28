package;

import flixel.group.FlxGroup;
import flixel.text.FlxText;


class HUD extends FlxGroup{
    var _score:FlxText;
    
    public function new(){
        super();
        _score = new FlxText(5, 5, 0, "Score: 000");
        add(_score);
    }

    override public function update(elapsed:Float):Void {
        var s:MatematicaState = cast FlxG.state;
    }
}