BeforeAll { 
    . "$PSScriptRoot\SharePointLookup.ps1"
}

Describe 'SharePointLookup' {
    It 'Test SharePointLookup' {
       # $result = SharePointLookup
        $result | Should -Be "UNKNOWN"
    }
}


