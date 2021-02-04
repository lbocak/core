function getProperty (){
param($bags, $name, $defaultValue)


    if ($null -eq $bags.$name) {
        if ($null -eq $defaultValue ) {
            Write-Error "Missing property value for $name"
            Done $hexatown
            Exit
        }
        return $defaultValue
    }

    return $bags.$name.Value
   

}
