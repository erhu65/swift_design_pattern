import Foundation;
enum NotificationTypes : String {
    case AUTH_SUCCESS = "AUTH_SUCCESS";
    case AUTH_FAIL = "AUTH_FAIL";
}
struct Notification {
    let type:NotificationTypes;
    let data:Any?;
}

protocol Observer : class {
        func notify(notification:Notification);
}

protocol Subject {
    func addObservers(observers:Observer...);
    func removeObserver(observer:Observer);
}

class SubjectBase : Subject{
        private var observers = [Observer]();
        private var collectionQueue = dispatch_queue_create("colQ", DISPATCH_QUEUE_CONCURRENT);
        
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
        
        
        func sendNotification(notification:Notification) {
            dispatch_sync(self.collectionQueue, { () in
                for ob in self.observers {
                    ob.notify(notification);
                }
            });
        }
}