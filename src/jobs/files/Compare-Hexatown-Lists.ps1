function Compare-Hexatown-Lists (){
param($hexatown, $map)

    ShowState "Loading Master" | Out-Null
    $masters = CreateDictionary $hexatown "$($map.list).master" 
    ShowState "Loading Slave" | Out-Null
    $slave = CreateDictionary $hexatown "$($map.list).slave" 
        
    $delta = buildDelta2  $slave  $masters $map.fields
        
    return $delta
        

}
