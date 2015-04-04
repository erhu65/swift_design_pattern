class ActivityLog : Observer {
    func notify(user: String, success: Bool) {
        println("Auth request for \(user). Success: \(success)");
    }
    
    func logActivity(activity:String) {
        println("Log: \(activity)");
    }
}

class FileCache : Observer {
    func notify(user: String, success: Bool) {
        if (success) {
                loadFiles(user);
        }
    }
    func loadFiles(user:String) {
        println("Load files for \(user)");
    }
}

class AttackMonitor : Observer {
        
    func notify(user: String, success: Bool) {
        monitorSuspiciousActivity = !success;
    }
    var monitorSuspiciousActivity: Bool = false {
        didSet {
            println("Monitoring for attack: \(monitorSuspiciousActivity)");
        }
    }
}
