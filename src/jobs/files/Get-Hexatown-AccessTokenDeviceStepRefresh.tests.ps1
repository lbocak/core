BeforeAll { 
    . "$PSScriptRoot\Get-Hexatown-AccessTokenDeviceStepRefresh.ps1"
}

Describe 'Get-Hexatown-AccessTokenDeviceStepRefresh' {
    It 'Test Get-Hexatown-AccessTokenDeviceStepRefresh' {
       # $result = Get-Hexatown-AccessTokenDeviceStepRefresh
        $result | Should -Be "UNKNOWN"
    }
}


