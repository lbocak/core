BeforeAll { 
    . "$PSScriptRoot\LastError.ps1"
}

Describe 'LastError' {
    It 'Test LastError' {
       # $result = LastError
        $result | Should -Be "UNKNOWN"
    }
}


