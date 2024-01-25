import funkin.game.PlayState;
/*

    DIFFERENT ASPECT RATIOS FOR CODENAME

    Songs that have different aspect ratios go into the switch case

*/

var aspectRatio:Array<Dynamic>;

function postCreate() {
    aspectRatio = [
        "16:9",
        "4:3"
    ];
}

function postUpdate() 
{
    switch(aspectRatio) {
        case "16:9":
            FlxG.scaleMode.width = 1280;
            FlxG.scaleMode.height = 720;
        case "4:3":
            FlxG.scaleMode.width = 1280;
            FlxG.scaleMode.height = 960;
    }

    if(aspectRatio == "4:3") {
        // i should've done a different way but whatever lmao
        for(healthBGStuff in [healthBarBG])
            healthBGStuff.y = 852;

        for(healthStuff in [healthBar])
            healthStuff.y = 856;

        for(icons in [iconP1, iconP2])
            icons.y = 780;

        scoreTxt.y = 890;
    }

    // put different aspect ratio songs here

    switch(PlayState.SONG.meta.name) {
        default:
            aspectRatio = "16:9";
    }
}