function Read (){
param($hexatown, $apiName, $method)

    $api = $hexatown.apis.$apiName.$method
    return GraphAPI $hexatown "GET" $api.url

}
