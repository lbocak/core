BeforeAll { 
    . "$PSScriptRoot\Get-Hexatown-AccessTokenDeviceStep1.ps1"
}

Describe 'Get-Hexatown-AccessTokenDeviceStep1' {
    It 'Test Get-Hexatown-AccessTokenDeviceStep1' {
       # $result = Get-Hexatown-AccessTokenDeviceStep1
        $result | Should -Be "UNKNOWN"
    }
}


