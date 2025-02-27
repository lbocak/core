function CreateDictionary (){
param($hexatown, $dataset, $key)

    $lookupGroups = @{}

    $indexColumn = "Title"
    if ($null -ne $key) {
        $indexColumn = $key
    
    }
        
    $items = loadFromJSON $hexatown.datapath $dataset


    foreach ($item in $items) {
        if (   $null -ne $item.$indexColumn -and !$lookupGroups.ContainsKey($item.$indexColumn) ) {
            $lookupGroups.Add($item.$indexColumn, $item)
        }
    }

    return $lookupGroups

}
