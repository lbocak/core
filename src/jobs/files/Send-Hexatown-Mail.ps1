function Send-Hexatown-Mail (){
param($hexatown, $from, $to, $subject, $messageBody)

    $body = @{
        message = @{
            subject      = $subject
            body         = @{
                contentType = "Text"
                content     = $messageBody
            }
            toRecipients = @(
                @{
                    emailAddress = @{
                        address = $to
                    }
                }
          
            )
        }
    } | ConvertTo-Json -Depth 10
    
    
    GraphAPI $hexatown POST "https://graph.microsoft.com/v1.0/users/$from/sendMail" $body
    

}
