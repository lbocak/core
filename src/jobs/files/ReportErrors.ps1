function ReportErrors (){
param($token, $site)

    if ($Error.Count -gt 0) {
        $errorMessages = ""
        foreach ($errorMessage in $Error) {
            if (($null -ne $errorMessage.InvocationInfo) -and ($errorMessage.InvocationInfo.ScriptLineNumber)) {
                $errorMessages += ("Line: " + $errorMessage.InvocationInfo.ScriptLineNumber + " "  )    
            }

            $errorMessages += $errorMessage.ToString() 
            $errorMessages += "`n"

        }

        LogToSharePoint $token $site "Error in PowerShell" "Error" "PowerShell"  $MyInvocation.MyCommand $null 0 $errorMessages
    }



    function ConnectExchange($username, $secret) {
        $code = ConvertTo-SecureString $secret -AsPlainText -Force
        $psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $code)
    
    
        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $psCred -Authentication Basic -AllowRedirection
        Import-PSSession $Session -DisableNameChecking 
        return $Session
    
    }
    

}
