function Get-Hexatown-AccessTokenDeviceStepRefresh (){
param($client_id, $client_domain, $refresh_token)

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    $body = "grant_type=refresh_token&client_id=$client_id&scope=$scope offline_access openid&refresh_token=$refresh_token"
    
    $response = Invoke-RestMethod "https://login.microsoftonline.com/$client_domain/oauth2/v2.0/token" -Method 'POST' -Headers $headers -body $body
    return $response
    

}
