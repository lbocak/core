BeforeAll { 
    . "$PSScriptRoot\PostSharePointListItem.ps1"
}

Describe 'PostSharePointListItem' {
    It 'Test PostSharePointListItem' {
       # $result = PostSharePointListItem
        $result | Should -Be "UNKNOWN"
    }
}


