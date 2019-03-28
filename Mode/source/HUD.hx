package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;


class HUD extends FlxGroup{
    var _score:FlxText;
    
    public function new(){
        super();
        _score = new FlxText(0, 0, 0, "Enemy Lives: 000");
        _score.y = FlxG.height - _score.height;
        add(_score);
    }

    override public function update(elapsed:Float):Void {
        var s:MatematicaState = cast FlxG.state;
    }
}