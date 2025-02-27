function LogToSharePoint (){
param($token, $site, $title, $status, $system, $subSystem, $reference, $Quantity, $details)

    $myHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $myHeaders.Add("Content-Type", "application/json")
    $myHeaders.Add("Accept", "application/json")
    $myHeaders.Add("Authorization", "Bearer $token" )
    $hostName = $env:COMPUTERNAME
    $details = $details -replace """", "\"""
    $body = "{
        `n    `"fields`": {
        `n        `"Title`": `"$title`",
        `n        `"Host`": `"$hostName`",
        `n        `"Status`": `"$status`",
        `n        `"System`": `"$system`",
        `n        `"SubSystem`": `"$subSystem`",
        `n        `"SystemReference`":`"$reference`",
        `n        `"Quantity`": $Quantity,
        `n        `"Details`": `"$details`"
        `n    }
        `n}"

    # write-output $body 
    #    Out-File -FilePath "$PSScriptRoot\error.json" -InputObject $body
    $url = ($site + '/Lists/Log/items/')
  
    $dummy = Invoke-RestMethod $url -Method 'POST' -Headers $myHeaders -Body $body 
    # return $null -eq $dummy

}
