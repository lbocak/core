BeforeAll { 
    . "$PSScriptRoot\Sync-Hexatown-List.ps1"
}

Describe 'Sync-Hexatown-List' {
    It 'Test Sync-Hexatown-List' {
       # $result = Sync-Hexatown-List
        $result | Should -Be "UNKNOWN"
    }
}


