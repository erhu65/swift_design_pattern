import Foundation;

class LedgerEntry {
    let id:Int;
    let counterParty:String;
    let amount:Float;
    
    init(id:Int, counterParty:String, amount:Float) {
        self.id = id; self.counterParty = counterParty; self.amount = amount;
    }
}

class LedgerCommand {
    
    private let instructions:Ledger -> Void;
    private let receiver:Ledger;
    
    init(instructions:Ledger -> Void, receiver:Ledger) {
        self.instructions = instructions; self.receiver = receiver;
    }
    
    func execute() {
        self.instructions(self.receiver);
    }
}

class Ledger {
            
        private var entries = [Int:LedgerEntry]();
        private var nextId = 1;
        var total:Float = 0;
            
        func addEntry(counterParty:String, amount:Float) -> LedgerCommand {
            let entry = LedgerEntry(id: nextId++, counterParty: counterParty, amount: amount);
            entries[entry.id] = entry;
            total += amount;
            return createUndoCommand(entry);
        }
            
        private func createUndoCommand(entry:LedgerEntry) -> LedgerCommand {
            return LedgerCommand(instructions: {target in
                let removed = target.entries.removeValueForKey(entry.id);
                if (removed != nil) {
                    target.total -= removed!.amount;
                }
            
            }, receiver: self);
        }
        
        func printEntries() {
            for id in entries.keys.array.sorted(<) {
                if let entry = entries[id] {
                    println("#\(id): \(entry.counterParty) $\(entry.amount)");
                }
            }
            println("Total: $\(total)");
            println("----");
        }
}