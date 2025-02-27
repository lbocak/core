function Get-Hexatown-AccessTokenDeviceStep2 (){
param($client_id, $client_domain, $device_code)

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    $body = "grant_type=urn:ietf:params:oauth:grant-type:device_code&client_id=$client_id&device_code=$device_code"
    $oldErrorPreference = $ErrorPreference
    $ErrorPreference = 'SilentlyContinue'
    DO
    {
        Sleep -Seconds 1
        
        try
        {
            $response = Invoke-RestMethod "https://login.microsoftonline.com/$client_domain/oauth2/v2.0/token" -Method 'POST' -Headers $headers -body $body        }
        catch [System.Net.WebException],[System.Exception]
        {
        
            $errorDetail =  $Error[0].ErrorDetails.Message | convertfrom-json
            $errorDetail.error
            if ("authorization_pending" -ne $errorDetail.error){
                FatalError $errorDetail.error
            }

        }
        

    } While ($null -eq $response)
    $ErrorPreference = $oldErrorPreference
    return $response
    

}
