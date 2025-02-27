function CreateSlaveDictionary (){
param($hexatown, $dataset, $fields)

    $lookupGroups = @{}
        
    $items = loadFromJSON $hexatown.datapath $dataset


    foreach ($item in $items) {
        if (   $null -ne $item.Title -and !$lookupGroups.ContainsKey($item.Title) ) {
            $cleanedItem = RemoveUnwantedProperties $item $fields
            $lookupGroups.Add($item.Title, $cleanedItem)
        }
    }

    return $lookupGroups

}
