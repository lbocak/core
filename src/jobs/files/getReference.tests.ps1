BeforeAll { 
    . "$PSScriptRoot\getReference.ps1"
}

Describe 'getReference' {
    It 'Test getReference' {
       # $result = getReference
        $result | Should -Be "UNKNOWN"
    }
}


