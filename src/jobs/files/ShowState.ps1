function ShowState (){
param($text)

    write-output $text ## for transcript log
    Write-Progress -Activity $text
    

}
