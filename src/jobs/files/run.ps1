function run (){
param($script)

    write-output "Running $script"
    & "$PSScriptRoot\$script.ps1"

}
