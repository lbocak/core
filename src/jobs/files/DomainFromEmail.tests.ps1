BeforeAll { 
    . "$PSScriptRoot\DomainFromEmail.ps1"
}

Describe 'DomainFromEmail' {
    It 'Test DomainFromEmail' {
       # $result = DomainFromEmail
        $result | Should -Be "UNKNOWN"
    }
}


