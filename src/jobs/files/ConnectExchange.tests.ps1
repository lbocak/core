BeforeAll { 
    . "$PSScriptRoot\ConnectExchange.ps1"
}

Describe 'ConnectExchange' {
    It 'Test ConnectExchange' {
       # $result = ConnectExchange
        $result | Should -Be "UNKNOWN"
    }
}


