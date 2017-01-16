if(-not (Test-Path $pshome/Modules/HangmanGame)){
    New-Item "$pshome/Modules/HangmanGame" -ItemType Directory
}
Copy-Item ./HangmanGame.psm1 $pshome/Modules/HangmanGame -Force -Verbose
Import-Module $pshome/Modules/HangmanGame/HangmanGame.psm1 -Force -Verbose

#Need to figure out why the following doesnt work. It's copied from an article on setting up a pester test
#$here = Split-Path -Parent $MyInvocation.MyCommand.Path
#$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
#. "$here/$sut"
#$dat = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Data\.', '.'
#. "$here\$dat"

Describe -Name Write-Gallows {
    It 'Draws the Gallows to indicate turn state' {
        $TurnState = $GameData.TurnStates #| Select-Object -First 1
        Write-Gallows $TurnState | Should Be $true
    }
}