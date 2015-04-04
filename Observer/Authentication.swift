class AuthenticationManager {
    private let log = ActivityLog();
    private let cache = FileCache();
    private let monitor = AttackMonitor();
    func authenticate(user:String, pass:String) -> Bool {
    
        var result = false;
        if (user == "bob" && pass == "secret") {
            result = true;
            println("User \(user) is authenticated");
            // call system components
            log.logActivity("Authenticated \(user)");
            cache.loadFiles(user);
            monitor.monitorSuspiciousActivity = false;
        } else { println("Failed authentication attempt");
            // call system components
            log.logActivity("Failed authentication: \(user)");
            monitor.monitorSuspiciousActivity = true;
        }
            return result;
    }
}
