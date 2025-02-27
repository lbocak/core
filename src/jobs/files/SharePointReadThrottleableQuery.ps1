function SharePointReadThrottleableQuery (){
param($hexatown, $path)

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Accept", "application/json")
    $headers.Add("Prefer", "allowthrottleablequeries")
    $headers.Add("Authorization", "Bearer $($hexatown.token)" )
    $url = $hexatown.site + $path
    $errorCount = $error.Count
    $result = Invoke-RestMethod ($url) -Method 'GET' -Headers $headers 
    if ($errorCount -ne $error.Count) {
        Write-Error $url
    }

    $data = $result.value
    $counter = 0
    while ($result.'@odata.nextLink') {
        Write-Progress -Activity "Reading from SharePoint $path" -Status "$counter Items Read" 

        if ($hexatown.verbose) {
            write-output "SharePointRead $($result.'@odata.nextLink')"
        }
        $result = Invoke-RestMethod ($result.'@odata.nextLink') -Method 'GET' -Headers $headers 
        $data += $result.value
        $counter += $result.value.Count
        
    }

    return $data

}
