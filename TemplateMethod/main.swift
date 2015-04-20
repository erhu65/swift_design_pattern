let donorDb = DonorDatabase();
let galaInvitations = donorDb.generate(2);
for invite in galaInvitations {
    println(invite);
}
donorDb.filter = { $0.filter({$0.lastDonation == 0})};
donorDb.generate = { $0.map({ "Hi \($0.firstName)"})};
let newDonors = donorDb.generate(Int.max);
for invite in newDonors {
    println(invite);
}
