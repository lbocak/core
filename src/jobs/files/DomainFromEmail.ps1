function DomainFromEmail (){
param($email)

    if ($null -eq $email) {
        return ""
    }
    $at = $email.indexOf("@");
    if ($at -gt 0) {
        return $email.Substring($at + 1)
    }
    else {
        return ""
    
    }
    

}
