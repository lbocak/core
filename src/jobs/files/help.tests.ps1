BeforeAll { 
    . "$PSScriptRoot\help.ps1"
}

Describe 'help' {
    It 'Test help' {
       # $result = help
        $result | Should -Be "UNKNOWN"
    }
}


