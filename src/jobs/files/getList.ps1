function getList (){
param($hexatown, $listName)


    Write-Progress -Activity "Downloading  $listName from SharePoint" 
   
    $items = (SharePointRead  $hexatown ('/Lists/' + $listName + '/items?$expand=fields'))

    $itemFields = @()

    foreach ($item in $items) {
        if ($item.fields) {
            $itemFields += $item.fields
        }
    }

    return $itemFields 

}
