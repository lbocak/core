function Get-Verb (){

param(
    [Parameter(ValueFromPipeline=$true)]
    [string[]]
    $verb = '*'
)
begin {
    $allVerbs = [System.Reflection.IntrospectionExtensions]::GetTypeInfo([PSObject]).Assembly.ExportedTypes |
        Microsoft.PowerShell.Core\Where-Object {$_.Name -match '^Verbs.'} |
        Microsoft.PowerShell.Utility\Get-Member -type Properties -static |
        Microsoft.PowerShell.Utility\Select-Object @{
            Name='Verb'
            Expression = {$_.Name}
        }, @{
            Name='Group'
            Expression = {
                $str = "$($_.TypeName)"
                $str.Substring($str.LastIndexOf('Verbs') + 5)
            }
        }
}
process {
    foreach ($v in $verb) {
        $allVerbs | Microsoft.PowerShell.Core\Where-Object { $_.Verb -like $v }
    }
}
# .Link
# https://go.microsoft.com/fwlink/?LinkID=160712
# .ExternalHelp System.Management.Automation.dll-help.xml

}
