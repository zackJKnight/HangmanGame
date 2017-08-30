Import-Module ./HangmanGame.psm1 -Force
InModuleScope HangmanGame {
Describe Write-Gallows {
        It 'Draws the Gallows to indicate turn state' {
            $TurnState = $GameData.TurnStates | Select-Object -First 1
            Write-Gallows $TurnState | Should Be $true
        }
}

Describe Write-Guesses {
    It 'Writes the letters that have been guessed incorrectly' {
        $testWrongLetters = @()
        $testWrongLetters += 'a'
        Write-Guesses $testWrongLetters | Should Not Be $null
    }
}
}