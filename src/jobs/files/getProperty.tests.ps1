BeforeAll { 
    . "$PSScriptRoot\getProperty.ps1"
}

Describe 'getProperty' {
    It 'Test getProperty' {
       # $result = getProperty
        $result | Should -Be "UNKNOWN"
    }
}


