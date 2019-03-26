package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;   

class GrupoState extends FlxState {

    var _azuis:FlxGroup;
    var _amarelos:FlxGroup;
    var _verdes:FlxGroup;

    override public function create():Void {
        _azuis = new FlxGroup();
        _amarelos = new FlxGroup();
        _verdes = new FlxGroup();
        var i;
        for(i in 0...10) {
            FlxG.log.add(i);
            var s:FlxSprite = new FlxSprite(i * 7, 15);
            s.makeGraphic(5, 5, 0xff0000ff);
            _azuis.add(s);
        }

        for(i in 0...15) {
            FlxG.log.add(i);
            var s:FlxSprite = new FlxSprite(i * 7, 25);
            s.makeGraphic(5, 5, 0xff00ff00);
            _verdes.add(s);
        }

        for(i in 0...30) {
            FlxG.log.add(i);
            var s:FlxSprite = new FlxSprite(i * 7, FlxG.height - 5);
            s.makeGraphic(5, 5, 0xffffff00);
            _amarelos.add(s);
        }
        add(_azuis);
        add(_verdes);
        add(_amarelos);
        super.create();
    }
}