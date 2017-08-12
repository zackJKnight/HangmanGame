#TODO generate the gallows rather than hardcoding it

Param(
$quit = $false,
$wrongLetters = @(),
$matchedLetters = @()
)

. ./HangmanGame.Data.ps1
Copy-Item ./HangmanGame.psm1 $pshome/Modules/HangmanGame -Force -Verbose
Import-Module -Global .\HangmanGame.psm1 -Force

function Write-Puzzle {
    Param(
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]
        $randomWord
    )

    $puzzle = @()
    
    for($i = 0; $i -lt $randomWord.Length; $i++){
        if($matchedLetters -contains $randomWord[$i] ){
            $puzzle += "$($randomWord[$i]) "
        }
        else {
            $puzzle += '__ '
        }
    }
    Write-Host $puzzle -ForegroundColor Blue -BackgroundColor Gray
}

function Clear-Values {
    $wrongLetters.Clear()
    $matchedLetters.Clear()
    $randomWord = ''
}
Clear-Values
Write-Host '====================PowerShell Hangman======================='
Write-Host $Gallows -ForegroundColor Red -BackgroundColor Gray
Write-BlankLines 2

$randomWord = (Get-Word).ToUpper()
$answer = $randomWord.ToCharArray() | Sort-Object -Descending| Get-Unique -AsString

Write-Host 'Save yourself from the gallows by guessing this word:' -ForegroundColor Yellow
Write-BlankLines 2
Write-Puzzle $randomWord
Write-BlankLines 2

while (($wrongLetters.Count -lt 7) -and (-not $quit)) {
    if($wrongLetters.Count -gt 0) {
        Write-Guesses $wrongLetters
    }
    try{
            [string]$read = (Read-Host -Prompt "Enter a letter or QUIT").ToUpper()
        }
        catch {
            Write-Host "Dear human, your cat is at the keyboard again." -ForegroundColor Yellow
            continue
        }

    #Clear-Host   
    #debug message
    Write-Host "Read from prompt: $read"  
    
    if($read -like 'QUIT'){
        #Clear-Host
        Write-Host "You've been pardoned." -ForegroundColor Yellow
        Clear-Values
        $quit = $true
        return
    }
# Regex Credit TesselatingHeckler on StackOverflow
    if((-not$read) -or ($read-replace'[a-z\s]','')) {
        Write-Host "A LETTER, ye great lunk!" -ForegroundColor Yellow
        Write-Puzzle $randomWord
        continue
    }

    if((($wrongLetters.Count -gt 0) -or ($matchedLetters.Count -gt 0)) `
    -and (($wrongLetters -contains $read[0]) `
    -or ($matchedLetters -contains $read[0]))) {
        Write-Host "Are ye a fool to guess the same letter more than once?" -ForegroundColor Yellow
        Write-Puzzle $randomWord
        continue
    }

    if($randomWord -match $read[0]){
        $matchedLetters += $read[0]
    }
    else {
        $wrongLetters += $read[0]
    }
    
    <#
    #debug messages
    "matched"
    $matchedLetters
    "wrong"
    $wrongLetters   

    Write-Host "Delete this, but the word is: $randomWord"
    #end debug messages
    #>

    Write-BlankLines 1
    Write-Puzzle $randomWord

$matched = $matchedLetters | Sort-Object -Descending

<#
#debug messages
"matched"
$matched
"answer"
$answer
#end debug messages #>

if("$matched" -eq "$answer"){
    Write-Host 'You win! Run before they change their minds!'
    return
}    
} 

if($wrongLetters.Count -eq 6) {
    Write-Host 'May your friends be heavy while they pull your legs.'
}