class ActivityLog {
    func logActivity(activity:String) {
        println("Log: \(activity)");
    }
}
class FileCache {
    func loadFiles(user:String) {
        println("Load files for \(user)");
    }
}
class AttackMonitor {
    var monitorSuspiciousActivity: Bool = false {
        didSet {
            println("Monitoring for attack: \(monitorSuspiciousActivity)");
        }
    }
}