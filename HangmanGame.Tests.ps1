<#
if(-not (Test-Path $pshome/Modules/HangmanGame)){
    New-Item "$pshome/Modules/HangmanGame" -ItemType Directory
}
#>
$AgentModulePath = "$($env:AGENT_HOMEDIRECTORY)\agent\worker\Modules"
New-Item $AgentModulePath/HangmanGame -ItemType Directory -Force
Copy-Item ./HangmanGame.psm1 $AgentModulePath -Force -Verbose
#Copy-Item ./HangmanGame.psm1 $pshome/Modules/HangmanGame -Force -Verbose
#Import-Module $pshome/Modules/HangmanGame/HangmanGame.psm1 -Force -Verbose
Import-Module $AgentModulePath/HangmanGame/HangmanGame.psm1 -Force -Verbose
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.ps1', '.psm1'
. "$here/$sut"
Import-Module $AgentModulePath\HangmanGame.psm1
#$dat = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Data\.', '.'
#. "$here\$dat"

Describe -Name Write-Gallows {
    InModuleScope HangmanGame {
        It 'Draws the Gallows to indicate turn state' {
            $TurnState = $GameData.TurnStates #| Select-Object -First 1
            Write-Gallows $TurnState | Should Be $true
        }
    }
}