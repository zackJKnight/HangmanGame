$GameData = @{
    BodyParts = @(
        Head = @{ID = 1; DefaultImage = '{)'},
        Torso = @{ID = 2; DefaultImage = '|'},
        RightArm = @{ID = 3; DefaultImage = '\'},
        LeftArm = @{ID = 4; DefaultImage = '/'},
        RightLeg = @{ID = 5; DefaultImage = '/'},
        LeftLeg = @{ID = 6; DefaultImage = '\'}
    );
TurnStates = @(
        'new game',
        'win turn',
        'loss turn',
        'win game',
        'lose game',
        'input error'
);
#Here-String - When you need a multiline string without doing a bunch of character escapes
Gallows = @"
    ________` ` ` ` ` ` ` ` `
    |\|     |` ` ` ` ` ` ` `
    |\|    $($Parts.Head)` ` ` ` ` ` ` `
    |\|    $($Parts.RightArm)$($PartsHash.Torso)$($this.BodyPartsHash.LeftArm.DefaultImage)` ` ` ` ` ` `
    |\|    $($BodyPartsHash.RightLeg) $($BodyPartsHash.LeftLeg)` ` ` ` ` ` `
==========` ` ` ` ` ` ` ` ` ` `
`[        `]` ` ` ` ` ` ` ` ` 
"@
}