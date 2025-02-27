function oss (){

[CmdletBinding()]
param(
    [ValidateRange(2, 2147483647)]
    [int]
    ${Width},

    [Parameter(ValueFromPipeline=$true)]
    [psobject]
    ${InputObject})

begin
{
    try {
        $PSBoundParameters['Stream'] = $true
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Out-String',[System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#
.ForwardHelpTargetName Out-String
.ForwardHelpCategory Cmdlet 
#>

}
