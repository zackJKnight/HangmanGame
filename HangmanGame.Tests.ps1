<#
if(-not (Test-Path $pshome/Modules/HangmanGame)){
    New-Item "$pshome/Modules/HangmanGame" -ItemType Directory
}
Copy-Item ./HangmanGame.psm1 $pshome/Modules/HangmanGame -Force -Verbose
Import-Module $pshome/Modules/HangmanGame/HangmanGame.psm1 -Force -Verbose
#>
Copy-Item .\ 'C:/program files (x86)/windowspowershell/Modules/HangmanGame' -Force -Verbose -Recurse
$modulePath = $($Env:PSModulePath).Split(';')[0]
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.ps1', '.psm1'
Import-Module ./HangmanGame.psm1 -Force

Describe -Name Write-Gallows {
    InModuleScope HangmanGame {
        It 'Draws the Gallows to indicate turn state' {
            $TurnState = $GameData.TurnStates | Select-Object -First 1
            Write-Gallows $TurnState | Should Be $true
        }
    }
}