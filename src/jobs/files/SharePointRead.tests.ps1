BeforeAll { 
    . "$PSScriptRoot\SharePointRead.ps1"
}

Describe 'SharePointRead' {
    It 'Test SharePointRead' {
       # $result = SharePointRead
        $result | Should -Be "UNKNOWN"
    }
}


