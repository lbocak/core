function getReference (){
param($dictionary, $key)

    if ($null -eq $key) {
        return $null
    }
    return $dictionary.$key

}
