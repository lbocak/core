BeforeAll { 
    . "$PSScriptRoot\EnsurePath.ps1"
}

Describe 'EnsurePath' {
    It 'Test EnsurePath' {
       # $result = EnsurePath
        $result | Should -Be "UNKNOWN"
    }
}


