BeforeAll { 
    . "$PSScriptRoot\buildDelta2.ps1"
}

Describe 'buildDelta2' {
    It 'Test buildDelta2' {
       # $result = buildDelta2
        $result | Should -Be "UNKNOWN"
    }
}


