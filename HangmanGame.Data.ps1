$GameData = @{
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
    |\|    $($Parts.Head.DefaultImage)` ` ` ` ` ` ` `
    |\|    $($Parts.RightArm.DefaultImage)$($Parts.Torso.DefaultImage)$($Parts.LeftArm.DefaultImage)` ` ` ` ` ` `
    |\|    $($Parts.RightLeg.DefaultImage) $($Parts.LeftLeg.DefaultImage)` ` ` ` ` ` `
==========` ` ` ` ` ` ` ` ` ` `
`[        `]` ` ` ` ` ` ` ` ` 
"@
}