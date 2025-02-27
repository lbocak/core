function buildDelta2 (){
param($masterItems, $slaveItems, $fields)

    ShowState "Building delta" 
    

    $delta = @{
        newItems     = @()
        deletedItems = @()
        changedItems = @()
    }

    foreach ($masterItemKey in $masterItems.keys) {
        if (!$slaveItems.containsKey($masterItemKey)) {
            $delta.newItems += RemoveStandardSharePointProperties $masterItems[$masterItemKey]
        }
    }
    
    foreach ($slaveItemKey in $slaveItems.keys) {
        if (!$masterItems.containsKey($slaveItemKey)) {
            $delta.deletedItems += $slaveItems[$slaveItemKey]
        }
    }

    foreach ($masterItemKey in $masterItems.keys) {

        if ($slaveItems.containsKey($masterItemKey)) {
            $masterItem = RemoveStandardSharePointProperties $masterItems[$masterItemKey]
            $slaveItem = $slaveItems[$masterItemKey]

            $changes = @()
            $hasChanges = $false


            foreach ($field in $fields) {
                $masterField = $masterItem.$field | ConvertTo-Json -Depth 10
                $slaveField = $slaveItem.$field | ConvertTo-Json -Depth 10

                if ($masterField -ne $slaveField ) {
                
                    $hasChanges = $true
                    $changes += ${
                    field  = $field
                    master =  $masterField 
                    slave =  $slaveField
                } | ConvertTo-Json
                }
            }


            if ($hasChanges ) {
                           

                $delta.changedItems += @{
                    slave  = $slaveItem
                    master = $masterItem
                }
            }
            
            
        }
    }
 
    

    return $delta


}
