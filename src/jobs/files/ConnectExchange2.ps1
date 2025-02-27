function ConnectExchange2 (){
param($appid, $token)


    write-output "Connecting to Exchange Online"
    
    if ($env:EXCHCERTIFICATEPATH -eq ""){
       FatalError 'Missing $env:EXCHCERTIFICATEPATH'
    }
    if ($env:EXCHCERTIFICATEPASSWORD -eq ""){
       FatalError 'Missing $env:EXCHCERTIFICATEPASSWORD'
    }
    if ($env:EXCHORGANIZATION -eq ""){
       FatalError 'Missing $env:EXCHORGANIZATION'
    }
    if ($env:EXCHAPPID -eq ""){
       FatalError 'Missing $env:EXCHAPPID'
    }
    
    $Session = Connect-ExchangeOnline -CertificateFilePath $env:EXCHCERTIFICATEPATH -CertificatePassword (ConvertTo-SecureString -String $env:EXCHCERTIFICATEPASSWORD -AsPlainText -Force) -AppID $env:EXCHAPPID -Organization $env:EXCHORGANIZATION
    
    return $Session
    

}
