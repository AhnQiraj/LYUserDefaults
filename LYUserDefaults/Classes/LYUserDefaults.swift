import Foundation


class LYUserDefaults: NSObject {
    class func isFirstDoSomeThing(identifier: String, callback: ()-> Void) {
        let isFirst = NSUserDefaults.standardUserDefaults().boolForKey(identifier)
        guard isFirst == true else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: identifier)
            NSUserDefaults.standardUserDefaults().synchronize()
            callback()
            return
        }
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: identifier)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func reset(identifier: String) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(identifier)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}