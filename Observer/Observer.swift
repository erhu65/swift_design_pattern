import Foundation;
protocol Observer : class {
    func notify(user:String, success:Bool);
}
protocol Subject {
    func addObservers(observers:Observer...);
    func removeObserver(observer:Observer);
}

class SubjectBase : Subject {
    private var observers = [Observer]();
    private var collectionQueue = dispatch_queue_create("colQ",
    DISPATCH_QUEUE_CONCURRENT);
    
    func addObservers(observers: Observer...) {
    
    dispatch_barrier_sync(self.collectionQueue, { () in
        for newOb in observers {
            self.observers.append(newOb);
        }
    });
}

    func removeObserver(observer: Observer) {
        dispatch_barrier_sync(self.collectionQueue, { () in
            self.observers = filter(self.observers, {$0 !== observer});
        });
    }
    
    func sendNotification(user:String, success:Bool) {
        dispatch_sync(self.collectionQueue, { () in
            for ob in self.observers {
                ob.notify(user, success: success);
            }
        });
    }
}