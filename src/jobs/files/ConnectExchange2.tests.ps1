BeforeAll { 
    . "$PSScriptRoot\ConnectExchange2.ps1"
}

Describe 'ConnectExchange2' {
    It 'Test ConnectExchange2' {
       # $result = ConnectExchange2
        $result | Should -Be "UNKNOWN"
    }
}


