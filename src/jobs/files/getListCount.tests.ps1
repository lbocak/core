BeforeAll { 
    . "$PSScriptRoot\getListCount.ps1"
}

Describe 'getListCount' {
    It 'Test getListCount' {
       # $result = getListCount
        $result | Should -Be "UNKNOWN"
    }
}


