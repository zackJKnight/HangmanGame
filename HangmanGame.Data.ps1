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
    |\|    $($this.Parts.Head.DefaultImage)` ` ` ` ` ` ` `
    |\|    $($this.Parts.RightArm.DefaultImage)$($this.Parts.Torso.DefaultImage)$($this.Parts.LeftArm.DefaultImage)` ` ` ` ` ` `
    |\|    $($this.Parts.RightLeg.DefaultImage) $($this.Parts.LeftLeg.DefaultImage)` ` ` ` ` ` `
==========` ` ` ` ` ` ` ` ` ` `
`[        `]` ` ` ` ` ` ` ` ` 
"@
}