BeforeAll { 
    . "$PSScriptRoot\Me.ps1"
}

Describe 'Me' {
    It 'Test Me' {
       # $result = Me
        $result | Should -Be "UNKNOWN"
    }
}


