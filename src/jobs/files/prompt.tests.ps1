BeforeAll { 
    . "$PSScriptRoot\prompt.ps1"
}

Describe 'prompt' {
    It 'Test prompt' {
       # $result = prompt
        $result | Should -Be "UNKNOWN"
    }
}


