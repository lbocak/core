BeforeAll { 
    . "$PSScriptRoot\Parse-JWTtoken.ps1"
}

Describe 'Parse-JWTtoken' {
    It 'Test Parse-JWTtoken' {
       # $result = Parse-JWTtoken
        $result | Should -Be "UNKNOWN"
    }
}


