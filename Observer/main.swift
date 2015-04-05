
// create meta observer
let monitor = AttackMonitor();
MetaSubject.sharedInstance.addObservers(monitor);

let log = ActivityLog();
let cache = FileCache();
//let monitor = AttackMonitor();

let authM = AuthenticationManager();

authM.addObservers(cache, monitor);
authM.authenticate("joe", pass: "shhh");
println("-----");
authM.authenticate("bob", pass: "secret");
print("end..")
