BeforeAll { 
    . "$PSScriptRoot\Pause.ps1"
}

Describe 'Pause' {
    It 'Test Pause' {
       # $result = Pause
        $result | Should -Be "UNKNOWN"
    }
}


