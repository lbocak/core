BeforeAll { 
    . "$PSScriptRoot\Compare-Hexatown-Lists.ps1"
}

Describe 'Compare-Hexatown-Lists' {
    It 'Test Compare-Hexatown-Lists' {
       # $result = Compare-Hexatown-Lists
        $result | Should -Be "UNKNOWN"
    }
}


