function Write-Hexatown-Log (){
param($hexatown, $title, $status, $system, $subSystem, $reference, $Quantity, $details)

 LogToSharePoint $hexatown.token  $hexatown.site $title $status $system $subSystem $reference  $Quantity  $details

}
