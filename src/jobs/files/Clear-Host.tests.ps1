BeforeAll { 
    . "$PSScriptRoot\Clear-Host.ps1"
}

Describe 'Clear-Host' {
    It 'Test Clear-Host' {
       # $result = Clear-Host
        $result | Should -Be "UNKNOWN"
    }
}


