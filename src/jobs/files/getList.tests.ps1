BeforeAll { 
    . "$PSScriptRoot\getList.ps1"
}

Describe 'getList' {
    It 'Test getList' {
       # $result = getList
        $result | Should -Be "UNKNOWN"
    }
}


