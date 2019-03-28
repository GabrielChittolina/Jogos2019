package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		//addChild(new FlxGame(320, 240, MenuState));
		//addChild(new FlxGame(320, 240, GrupoState));
		//addChild(new FlxGame(320, 240, SpriteState));
		//addChild(new FlxGame(1024, 1024, TestState));
		//addChild(new FlxGame(320, 240, MeuMenuState));
		//addChild(new FlxGame(320, 240, UpdateState));
		addChild(new FlxGame(320, 240, MatematicaState));
	}
}