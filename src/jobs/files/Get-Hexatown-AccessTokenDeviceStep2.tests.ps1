BeforeAll { 
    . "$PSScriptRoot\Get-Hexatown-AccessTokenDeviceStep2.ps1"
}

Describe 'Get-Hexatown-AccessTokenDeviceStep2' {
    It 'Test Get-Hexatown-AccessTokenDeviceStep2' {
       # $result = Get-Hexatown-AccessTokenDeviceStep2
        $result | Should -Be "UNKNOWN"
    }
}


