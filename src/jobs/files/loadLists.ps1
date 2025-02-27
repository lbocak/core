function loadLists (){
param($hexatown, $schema, $lists)

    $lookup = @{}
    foreach ($list in $lists) {
        
        $items = loadFromJSON $hexatown.datapath "$($list.Name).sharepoint" 

        write-output "$($list.Name) $($items.Count) items"
        foreach ($item in $items) {
            $lookup.Add("$($list.Name)__$($item.id)", $item)
        }

    }
    return $lookup

}
