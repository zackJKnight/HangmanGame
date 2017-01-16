$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here/$sut"

Describe Get-Hello {
    It 'Returns a string greeting' {
        Get-Hello | Should Be 'Hello, World!'
    }
}