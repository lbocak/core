function downloadLists (){
param($hexatown, $schema, $lists)

    $counter = 0
    
    foreach ($list in $lists) {
        

        Write-Progress -Activity "Downloading  $($lists.Count) list from SharePoint" -Status "$counter Read" -CurrentOperation "Lists $list"
        $listName = $schema | Select -ExpandProperty $list.Name
        $items = (SharePointRead  $hexatown ('/Lists/' + $listName + '/items?$expand=fields'))

        $itemFields = @()

        foreach ($item in $items) {
            if ($item.fields) {
                $itemFields += $item.fields
            }
            # $lookup.Add("$($list.Name):$($item.id)",$item)
        }


        $counter += $items.Count
        ConvertTo-Json -InputObject $itemFields  -Depth 10 | Out-File "$($hexatown.datapath)\$($list.Name).sharepoint.json" 
    }
    Write-Progress -Completed  -Activity "done"

}
