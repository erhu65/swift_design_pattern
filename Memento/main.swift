let ledger = Ledger();
ledger.addEntry("Bob", amount: 100.43);
ledger.addEntry("Joe", amount: 200.20);
let memento = ledger.createMemento() as LedgerMemento;
let newMemento = LedgerMemento(json: memento.jsonData);
ledger.addEntry("Joe2", amount: 300.20);
ledger.printEntries();
ledger.applyMemento(newMemento);
ledger.printEntries();