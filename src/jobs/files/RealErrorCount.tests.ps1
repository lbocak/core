BeforeAll { 
    . "$PSScriptRoot\RealErrorCount.ps1"
}

Describe 'RealErrorCount' {
    It 'Test RealErrorCount' {
       # $result = RealErrorCount
        $result | Should -Be "UNKNOWN"
    }
}


