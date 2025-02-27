function Done (){
param($hexatown)


    Write-Progress -Completed  -Activity "done"
    if (!$hexatown.IsDev) {
        write-output "Closing sessions"
        get-pssession | Remove-PSSession
        if ($hexatown.hasExchange){
            Disconnect-ExchangeOnline -Confirm:$false
        }
    }
    if ($hexatown.hasSharePoint){
        ReportErrors $hexatown.token $hexatown.site
    }
    Stop-Transcript

}
