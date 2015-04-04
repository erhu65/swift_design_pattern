let log = ActivityLog();
let cache = FileCache();
let monitor = AttackMonitor();

let authM = AuthenticationManager();
authM.addObservers(log, cache, monitor);
authM.authenticate("bob", pass: "secret");
println("-----");
authM.authenticate("joe", pass: "shhh");
