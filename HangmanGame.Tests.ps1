Import-Module ./HangmanGame.psm1 -Force

Describe -Name Write-Gallows {
    InModuleScope HangmanGame {
        It 'Draws the Gallows to indicate turn state' {
            $TurnState = $GameData.TurnStates | Select-Object -First 1
            Write-Gallows $TurnState | Should Be $true
        }
    }
}