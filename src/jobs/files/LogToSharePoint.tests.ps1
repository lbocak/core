BeforeAll { 
    . "$PSScriptRoot\LogToSharePoint.ps1"
}

Describe 'LogToSharePoint' {
    It 'Test LogToSharePoint' {
       # $result = LogToSharePoint
        $result | Should -Be "UNKNOWN"
    }
}


