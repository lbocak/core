function CreateMasterDictionary (){
param($hexatown, $dataset, $fields)

    $lookupGroups = @{}
        
    $items = loadFromJSON $hexatown.datapath $dataset


    foreach ($item in $items) {
        if (   $null -ne $item.Title -and !$lookupGroups.ContainsKey($item.Title) ) {
            $cleanedItem = RemoveStandardSharePointProperties $item $fields
            # $cleanedItem = RemoveStandardSharePointProperties cleanedItem
            if ($null -ne $item.Title) {
                $lookupGroups.Add($item.Title, $cleanedItem)
            }
        }
    }

    return $lookupGroups

}
