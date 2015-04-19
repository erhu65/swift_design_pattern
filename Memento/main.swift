let ledger = Ledger();
ledger.addEntry("Bob", amount: 100.43);
ledger.addEntry("Joe", amount: 200.20);
let memento = ledger.createMemento();
ledger.addEntry("Alice", amount: 500);
ledger.addEntry("Tony", amount: 20);
ledger.printEntries();
ledger.applyMemento(memento);
ledger.printEntries();