BeforeAll { 
    . "$PSScriptRoot\Start-HexatownApp.ps1"
}

Describe 'Start-HexatownApp' {
    It 'Test Start-HexatownApp' {
       # $result = Start-HexatownApp
        $result | Should -Be "UNKNOWN"
    }
}


