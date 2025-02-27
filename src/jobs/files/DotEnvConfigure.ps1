function DotEnvConfigure (){
param($debug, $path)


    $loop = $true

    $package = loadFromJSON $path "/../../../package"


    
    $environmentPath = $env:HEXATOWNHOME
    if ($null -eq $environmentPath ) {
        $environmentPath = ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonApplicationData)) 
    }
    $path = "$environmentPath/hexatown.com/$($package.name)"
 
 
    EnsurePath "$environmentPath/hexatown.com"
    if (!(test-path "$environmentPath/hexatown.com/$($package.name)") ) {
        EnsurePath "$environmentPath/hexatown.com/$($package.name)"
        Start-Process "$environmentPath/hexatown.com/$($package.name)"
    }
    
    

    do {
        $filename = "$path\.env"
        if ($debug) {
            write-output "Checking $filename"
        }
        if (Test-Path $filename) {
            if ($debug) {
                write-output "Using $filename"
            }
            $lines = Get-Content $filename
             
            foreach ($line in $lines) {
                    
                $nameValuePair = $line.split("=")
                if ($nameValuePair[0] -ne "") {
                    if ($debug) {
                        write-host "Setting >$($nameValuePair[0])<"
                    }
                    $value = $nameValuePair[1]
                    
                    for ($i = 2; $i -lt $nameValuePair.Count; $i++) {
                        $value += "="
                        $value += $nameValuePair[$i]
                    }

                    if ($debug) {
                        write-host "To >$value<"
                    }    
                    [System.Environment]::SetEnvironmentVariable($nameValuePair[0], $value)
                }
            }
    
            $loop = $false
        }
        else {
            $lastBackslash = $path.LastIndexOf("\")
            if ($lastBackslash -lt 4) {
                $loop = $false
                if ($debug) {
                    write-output "Didn't find any .env file  "
                }
            }
            else {
                $path = $path.Substring(0, $lastBackslash)
            }
        }
    
    } while ($loop)
    

}
