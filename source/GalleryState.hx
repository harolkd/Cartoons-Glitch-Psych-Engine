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
  var bg:FlxSprite;
  var pic:FlxSprite;
  var picsList:Array<String> = CoolUtil.coolTextFile(Paths.getPreloadPath('images/gallery/names.txt'));
  var curSelected:Int;
  var arrows:FlxSprite;
  var back:FlxSprite;

  override function create() {

    bg = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
    add(bg);

    pic = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/' + picsList[curSelected]));
    pic.scale.set(0.8, 0.8);
    pic.updateHitbox();
    pic.screenCenter();
		pic.antialiasing = ClientPrefs.globalAntialiasing;
    add(pic);

    arrows = new FlxSprite(1100, 500).loadGraphic(Paths.image('arrows'));
    arrows.scale.set(0.5, 0.5);
    arrows.antialiasing = ClientPrefs.globalAntialiasing;
    add(arrows);

    back = new FlxSprite(0, 0).loadGraphic(Paths.image('back'));
    back.scale.set(0.5, 0.5);
    back.antialiasing = ClientPrefs.globalAntialiasing;
    add(back);

    super.create();
  }

  override public function update(elapsed:Float):Void {

    if (controls.UI_UP_P)
    {
      FlxG.sound.play(Paths.sound('scrollMenu'));
      change(-1);
    }

    if (controls.UI_DOWN_P)
    {
      FlxG.sound.play(Paths.sound('scrollMenu'));
      change(1);
    }

    if (controls.BACK)
    {
      FlxG.sound.play(Paths.sound('cancelMenu'));
      MusicBeatState.switchState(new MainMenuState());
    }

    super.update(elapsed);
  }

  function change(huh:Int = 0)
	{
    curSelected += huh;

		if (curSelected >= picsList.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = picsList.length - 1;

			pic.visible = true;
      pic.loadGraphic(Paths.image('gallery/' + picsList[curSelected]));
      pic.updateHitbox();
      pic.screenCenter();
  }
}
