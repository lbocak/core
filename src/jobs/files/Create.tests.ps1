BeforeAll { 
    . "$PSScriptRoot\Create.ps1"
}

Describe 'Create' {
    It 'Test Create' {
       # $result = Create
        $result | Should -Be "UNKNOWN"
    }
}


