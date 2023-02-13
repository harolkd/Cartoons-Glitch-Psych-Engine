package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import Achievements;
import lime.app.Application;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class GalleryState extends MusicBeatState
{

  var changeItem:Int = 0;
  var pic:FlxSprite;
  var picsList:Array<String> = ["deadline", "winton", "fireworks"]
  var curSelected:Int;

  override public function create():Void {

    pic = new FlxSprite(280, 100);
		pic.antialiasing = ClientPrefs.globalAntialiasing;
    add(pic);

    super.create()
  }

  override public function update(elapsed:Float):Void {

    if (controls.UI_UP_P)
    {
      FlxG.sound.play(Paths.sound('scrollMenu'));
      changeItem(-1);
    }

    if (controls.UI_DOWN_P)
    {
      FlxG.sound.play(Paths.sound('scrollMenu'));
      changeItem(1);
    }

    if (controls.BACK)
    {
      selectedSomethin = true;
      FlxG.sound.play(Paths.sound('cancelMenu'));
      MusicBeatState.switchState(new MainMenuState());
    }

    super.update(elapsed);
  }

  function changeItem(huh:Int = 0)
	{
    curSelected += huh;

		if (curSelected >= picsList.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = picsList.length - 1;

			pic.visible = true;
			pic.loadGraphic(Paths.image('gallery/bg_' + picsList[curSelected]));
  }
}
