BeforeAll { 
    . "$PSScriptRoot\FatalError.ps1"
}

Describe 'FatalError' {
    It 'Test FatalError' {
       # $result = FatalError
        $result | Should -Be "UNKNOWN"
    }
}


