function Init (){
param($invocation, $requireExchange, $delegated, $scope)

    $scriptName = $invocation.MyCommand.Name
    $path = Split-Path $invocation.MyCommand.Path
    DotEnvConfigure $false $path

    if ($null -eq $env:DEVELOP) {
        $WarningPreference = 'SilentlyContinue'
        $DebugPreference = 'SilentlyContinue'
        $ProgressPreference = 'SilentlyContinue'
        $VerbosePreference = 'SilentlyContinue'
    }

    $package = loadFromJSON $path "/../../../package"
    $srcPath = (Resolve-Path ($path + "\..\..\..")).Path
    
    
    $environmentPath = $env:HEXATOWNHOME
    if ($null -eq $environmentPath ) {
        $environmentPath = ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonApplicationData)) 
    }
    

    $homePath = (Resolve-Path ("$environmentPath/hexatown.com/$($package.name)"))

    $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
   
    $tenantDomain = $ENV:AADDOMAIN
    if ($null -eq $tenantDomain) {
        $tenantDomain = "hexatown.com"
        Write-Host "Environment name not set - defaulting to $tenantDomain" -ForegroundColor Yellow
        
    }

    
    EnsurePath "$homePath\logs"

    $logPath = "$homePath\logs\$tenantDomain"
    EnsurePath $logPath

    $metadataPath = "$srcPath\.metadata"
    EnsurePath $metadataPath


    $timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-dd-hh-mm-ss")
 
    Start-Transcript -Path "$logPath\$scriptName-$timestamp.log" | Out-Null

    EnsurePath "$homePath\data"

    $dataPath = "$homePath\data" #TODO: Make data path tenant aware
    $dataPath = "$datapath\$tenantDomain" #TODO: Make data path tenant aware
    EnsurePath $dataPath


    $Error.Clear() 
 

    $dev = $env:DEBUG
    $hasSharePoint = $false
    if (!$delegated){


    $token = GetAccessToken $env:APPCLIENT_ID $env:APPCLIENT_SECRET $env:APPCLIENT_DOMAIN
    $site = FindSiteByUrl $token $env:SITEURL
    if ($env:HEXATOWNURL) {
        $hexatownsite = FindSiteByUrl $token $env:HEXATOWNURL
    }
    
    
    if ($null -eq $site) {
        Write-Warning "Not able for find site - is \$env:SITEURL defined?"
        exit
    }
    $hasSharePoint = $true
    }else{
    if ($null -eq $scope){
        $scope = "Team.ReadBasic.All User.ReadBasic.All "
    }
    
    $token = Get-Hexatown-Delegate $dataPath $scope

    
    }

    $schema = loadFromJSON $path ".schema"

    $hexatown = @{
        $logPath     = "$logPath\$tenantDomain"
        domain       = $tenantDomain
        IsDev        = $dev
        site         = $site
        datapath     = $dataPath
        metadatapath = $metadataPath
        logpath      = $logPath
        token        = $token
        verbose      = $env:VERBOSE
        session      = $session
        siteUrl      = $env:SITEURL
        appId        = $env:APPCLIENT_ID
        appSecret    = $env:APPCLIENT_SECRET 
        appDomain    = $env:APPCLIENT_DOMAIN
        hexatown     = $hexatownsite
        schema       = $schema
        isDelegate   = $delegated
        hasSharePoint= $hasSharePoint
        hasExchange  = $requireExchange
        apis         = @{
                        my = @{
                            self =   @{
                                url = "https://graph.microsoft.com/v1.0/me"
                            }
                            teams = @{
                                url = "https://graph.microsoft.com/v1.0/me/joinedTeams"
                            }
                        }

                        }
    }


    if ($requireExchange) {
        # https://www.quadrotech-it.com/blog/certificate-based-authentication-for-exchange-online-remote-powershell/
    
            $modulePath = Join-Path $path "modules"
            Import-Module -Name "$modulePath\ExchangeOnlineManagement" -DisableNameChecking
    
            $errorCount = (RealErrorCount)
            #$session = ConnectExchange $env:AADUSER $env:AADPASSWORD
            $session = ConnectExchange2 $env:APPCLIENT_ID $token
            if ($errorCount -ne (RealErrorCount)) {
                Write-Warning "Cannot connect to Exchange"
                Done $hexatown
                exit
            }
    
        }
    
    return $hexatown


}
