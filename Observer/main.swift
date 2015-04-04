
let authM = AuthenticationManager();
authM.authenticate("bob", pass: "secret");
println("-----");
authM.authenticate("joe", pass: "shhh");