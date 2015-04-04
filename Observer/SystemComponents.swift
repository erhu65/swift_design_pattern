class ActivityLog : Observer {
   
    func notify(notification:Notification) {
        println("Auth request for \(notification.type.rawValue) " + "Success: \(notification.data!)");
    }
    
    func logActivity(activity:String) {
        println("Log: \(activity)");
    }
}

class FileCache : Observer {
        
    func notify(notification:Notification) {
        if (notification.type == NotificationTypes.AUTH_SUCCESS) {
            loadFiles(notification.data! as String);
        }
    }
        
    func loadFiles(user:String) {
        println("Load files for \(user)");
    }
}

class AttackMonitor : Observer {
        
    func notify(notification: Notification) {
        monitorSuspiciousActivity = (notification.type == NotificationTypes.AUTH_FAIL);
    }
            
    var monitorSuspiciousActivity: Bool = false {
        didSet {
            println("Monitoring for attack: \(monitorSuspiciousActivity)");
        }
    }
}
