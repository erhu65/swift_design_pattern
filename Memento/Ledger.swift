import Foundation;

class LedgerEntry {
    let id:Int;
    let counterParty:String;
    let amount:Float;
    
    init(id:Int, counterParty:String, amount:Float) {
        self.id = id; self.counterParty = counterParty; self.amount = amount;
    }
}

class LedgerMemento : Memento {
    
    let jsonData:String?;
    
    init(ledger:Ledger) {
        self.jsonData = stringify(ledger);
    }
    
    init(json:String?) {
        self.jsonData = json;
    }
    
    private func stringify(ledger:Ledger) -> String? {
        var dict = NSMutableDictionary();
        dict["total"] = ledger.total;
        dict["nextId"] = ledger.nextId;
        dict["entries"] = ledger.entries.values.array;
        var entryArray = [NSDictionary]();
        
        for entry in ledger.entries.values {
            var entryDict = NSMutableDictionary();
            entryArray.append(entryDict);
            entryDict["id"] = entry.id;
            entryDict["counterParty"] = entry.counterParty;
            entryDict["amount"] = entry.amount;
        }
        
        dict["entries"] = entryArray;
        if let jsonData = NSJSONSerialization.dataWithJSONObject(dict,
            options: nil, error: nil) {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding);
        }
        return nil;
    }
    
    func apply (ledger:Ledger) {
            
        if let data = jsonData?.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            if let dict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
        
                ledger.total = dict["total"] as Float;
                ledger.nextId = dict["nextId"] as Int;
                ledger.entries.removeAll(keepCapacity: true);
                if let entryDicts = dict["entries"] as? [NSDictionary] {
                    for dict in entryDicts {
                        let id = dict["id"] as Int;
                        let counterParty = dict["counterParty"] as String;
                        let amount = dict["amount"] as Float;
                        ledger.entries[id] = LedgerEntry(id: id,counterParty: counterParty, amount: amount);
                    }
                }
            }
        }
    }
}

class Ledger : Originator {
            
            private var entries = [Int:LedgerEntry]();
            private var nextId = 1;
            var total:Float = 0;
            func addEntry(counterParty:String, amount:Float) {
                let entry = LedgerEntry(id: nextId++, counterParty: counterParty, amount: amount);
                entries[entry.id] = entry;
                    total += amount;
            }
            
            func createMemento() -> Memento {
                return LedgerMemento(ledger: self);
            }
            
            func applyMemento(memento: Memento) {
                if let m = memento as? LedgerMemento {
                    m.apply(self);
                }
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