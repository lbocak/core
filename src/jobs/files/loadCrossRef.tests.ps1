BeforeAll { 
    . "$PSScriptRoot\loadCrossRef.ps1"
}

Describe 'loadCrossRef' {
    It 'Test loadCrossRef' {
       # $result = loadCrossRef
        $result | Should -Be "UNKNOWN"
    }
}


