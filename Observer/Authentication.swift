class AuthenticationManager : SubjectBase {
    
    func authenticate(user:String, pass:String) -> Bool {

        var result = false;
        if (user == "bob" && pass == "secret") {
            result = true;
            println("User \(user) is authenticated");
        } else {
            println("Failed authentication attempt");
        
        }
            sendNotification(user, success: result);
            return result;
        }
}