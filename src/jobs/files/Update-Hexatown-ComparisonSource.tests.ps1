BeforeAll { 
    . "$PSScriptRoot\Update-Hexatown-ComparisonSource.ps1"
}

Describe 'Update-Hexatown-ComparisonSource' {
    It 'Test Update-Hexatown-ComparisonSource' {
       # $result = Update-Hexatown-ComparisonSource
        $result | Should -Be "UNKNOWN"
    }
}


