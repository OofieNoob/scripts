import funkin.game.PlayState;
/*
* literally just the original fnf UI
* but with cam movement system and smooth bar...
  credits lmfao
* @YasherMania - PsychUI [what this is mainly based off of]
* @wizard.hx - Camera Move on Note [pretty obvious]
* @ne_eo - Smooth Healthbar
*/

var camMove:Int = 15;
var displayHealth:Float = 1;

// SETTINGS
var cameraNoteHitMove:Bool = false;
var smoothBar:Bool = true;

function postCreate() 
{
    scoreTxt.x = FlxG.width - scoreTxt.width - 380;
	scoreTxt.size = 16;

    for (i in [accuracyTxt, missesTxt])
		i.visible = false;
}

function postUpdate(elapsed) 
{

    if(cameraNoteHitMove) {
        switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
            case "singLEFT": camFollow.x -= camMove;
            case "singDOWN": camFollow.y += camMove;
            case "singUP": camFollow.y -= camMove;
            case "singRIGHT": camFollow.x += camMove;
        }
    }

    if(smoothBar) {
        healthBar.value = displayHealth;
        healthBar.numDivisions = 800;

        displayHealth = FlxMath.lerp(displayHealth, PlayState.instance.health, FlxMath.bound(0.2 * 60 * elapsed, 0, 1));
        if(Math.abs(displayHealth - PlayState.instance.health) < 0.01)
            displayHealth = PlayState.instance.health;

        var percent = 1 - displayHealth / 2;

        percent = FlxMath.bound(percent, 0, 1);
    }
}