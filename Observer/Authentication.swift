class AuthenticationManager : ShortLivedSubject {
    
    func authenticate(user:String, pass:String) -> Bool {
        var isSuccess = false;
        var nType = NotificationTypes.AUTH_FAIL;
        if (user == "bob" && pass == "secret") {
            isSuccess = true;
            nType = NotificationTypes.AUTH_SUCCESS;
            println("User \(user) is authenticated");
        } else {
            println("Failed authentication attempt");
        }
        
        let authenticationNoti = AuthenticationNotification(user: user, success: isSuccess);
        sendNotification(authenticationNoti);
        
        return nType == NotificationTypes.AUTH_SUCCESS;
        
    }
}