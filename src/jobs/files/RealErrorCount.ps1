function RealErrorCount (){

    $c = 0
    foreach ($e in $Error) {
        $m = $e.ToString()
        if (!$m.Contains("__Invoke-ReadLineForEditorServices")) {
            $c++
        }
    }
    return $c 

}
