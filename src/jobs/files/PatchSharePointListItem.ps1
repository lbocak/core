function PatchSharePointListItem (){
param($token, $site, $listName, $listItemId, $body)

    # https://stackoverflow.com/questions/49238355/whats-the-post-body-to-create-multichoice-fields-in-sharepoint-online-using-gra
    $myHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $myHeaders.Add("Content-Type", "application/json; charset=utf-8")
    $myHeaders.Add("Accept", "application/json")
    $myHeaders.Add("Authorization", "Bearer $token" )
    $hostName = $env:COMPUTERNAME
    $details = $details -replace """", "\"""
        
    # write-output $body 
    #    Out-File -FilePath "$PSScriptRoot\error.json" -InputObject $body
    $url = ($site + "/Lists/$listName/items/$listItemId")
    # write-output $url
    return Invoke-RestMethod $url -Method 'PATCH' -Headers $myHeaders -Body ([System.Text.Encoding]::UTF8.GetBytes($body) )
    # return $null -eq $dummy

}
