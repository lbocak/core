BeforeAll { 
    . "$PSScriptRoot\RefreshSharePointList.ps1"
}

Describe 'RefreshSharePointList' {
    It 'Test RefreshSharePointList' {
       # $result = RefreshSharePointList
        $result | Should -Be "UNKNOWN"
    }
}


