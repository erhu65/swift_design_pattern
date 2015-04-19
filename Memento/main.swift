let ledger = Ledger();
ledger.addEntry("Bob", amount: 100.43);
ledger.addEntry("Joe", amount: 200.20);
let aliceUndoCommand = ledger.addEntry("Alice", amount: 500);
let tonyUndoCommand = ledger.addEntry("Tony", amount: 20);
ledger.printEntries();
tonyUndoCommand.execute();
aliceUndoCommand.execute();
ledger.printEntries();
