BeforeAll { 
    . "$PSScriptRoot\CreateDictionary.ps1"
}

Describe 'CreateDictionary' {
    It 'Test CreateDictionary' {
       # $result = CreateDictionary
        $result | Should -Be "UNKNOWN"
    }
}


