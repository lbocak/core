BeforeAll { 
    . "$PSScriptRoot\buildDelta.ps1"
}

Describe 'buildDelta' {
    It 'Test buildDelta' {
       # $result = buildDelta
        $result | Should -Be "UNKNOWN"
    }
}


