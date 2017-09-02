#This is my personal reference guide for basic PowerShell concepts.
#And a gift to my father and my son for their love of game making.
#Zack Knight 2017
#. .\HangmanGame.Data.ps1
$hangmanJson = Get-Content .\HangmanGame.Data.json

class BodyPart {
    [int]$ID
    [string]$Name
    [bool]$Visible
    [string]$DefaultImage
    [string]$CelebratoryImage
    [string]$WoefulImage
    [string]$HiddenImage

    BodyPart([int]$ID, [string]$Name, [string]$DefaultImage){
        $this.ID = $ID
        $this.Name = $Name
        $this.DefaultImage = $DefaultImage
    }
}

function Get-HangmanParts {

$json = ConvertFrom-Json "$hangmanJson"

$Parts = @()

foreach($part in $json.BodyParts) {
    try{
    $Parts += New-Object BodyPart($part.ID, $part.Name, $part.DefaultImage)
    }
    catch{
        return $Error
    }
}
return $Parts
}
function Get-Word {
    $request = Invoke-WebRequest http://setgetgo.com/randomword/get.php | Select-Object -ExpandProperty Content
    return $request
}

function Write-BlankLines {
    param(
        [int]$lineCount
    )
    $lineCount | ForEach-Object{Write-Host "$([Environment]::NewLine)"}
}

function Write-Gallows {
    Param(
        $state = 'new game'
    )

# wrong guesses - set a part count and foreach write a body part 
    
    if($Parts -ne $null){
        return $true
    }
    else{
    return $false
    }
}

function Write-Guesses {
    Param(
        [Parameter(Mandatory = $true)]
        $wrongLetters
    )
    Write-Host "These are the letters that weigh against you:" -ForegroundColor Yellow
    Write-Host $wrongLetters -ForegroundColor Red
    
}

function Start-Turn {
    # intro
    # loop:
    # take letter
    # add to correct list
    # draw updated hangman pic
    # print updated puzzle with correct guesses
    # win
    # get-hung
}

Export-ModuleMember -Function *