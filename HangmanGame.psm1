#This is my personal reference guide for basic PowerShell concepts.
#And a gift to my father and my son for their love of game making.
#Zack Knight 2017
. .\HangmanGame.Data.ps1

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

function Get-Word {
    $request = Invoke-WebRequest http://randomword.setgetgo.com/get.php | Select-Object -ExpandProperty Content
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
        [hashtable]$state = 'new game'
    )
    
    $Parts = @()
    foreach($part in $GameData.BodyParts) {
        try{
            #TODO Start here. the data structure is incorrect
            #the keys are strings and they actually have hastables.... you need to change the data structure.
        $Parts += new BodyPart($part.ID.Value, $part, $part.DefaultImage.Value)
        }
        catch{
            return $Error
        }
    }
    
    if($Parts -ne $null){
        return $true
    }
    else{
    return $false
    }
}

function Write-Guesses {
    Param(
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