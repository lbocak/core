BeforeAll { 
    . "$PSScriptRoot\FindSiteByUrl.ps1"
}

Describe 'FindSiteByUrl' {
    It 'Test FindSiteByUrl' {
       # $result = FindSiteByUrl
        $result | Should -Be "UNKNOWN"
    }
}


