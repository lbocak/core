function SharePointLookup (){
param($hexatown, $path)

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Accept", "application/json")
    $headers.Add("Authorization", "Bearer $($hexatown.token)" )
    $url = $hexatown.site + $path
    if ($hexatown.verbose) {
        write-output "SharePointLookup $url"
    }
    $result = Invoke-RestMethod ($url) -Method 'GET' -Headers $headers 
    return $result


}
