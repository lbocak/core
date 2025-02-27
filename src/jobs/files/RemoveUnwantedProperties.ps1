function RemoveUnwantedProperties (){
param($item, $wantedFields)

    $fieldsToKeep = @{}
    foreach ($wantedField in $wantedFields) {
        $fieldsToKeep.Add($wantedField, $wantedField  )
    }

    $fields = $item | Get-Member -MemberType NoteProperty | select Name

    

    foreach ($field in $fields) {
        if (!$fieldsToKeep.ContainsKey($field.Name)) {
            $item.PSObject.Properties.Remove($field.Name)
        }
    }

    return $item

}
