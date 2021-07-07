import Foundation

class AddHelper{
    let addPreferenceKey = "AddPreferenceKey"
    let userDefaults = UserDefaults.standard
    
    //added
    func added(){
        userDefaults.set("Added", forKey: addPreferenceKey)
    }
    
    //not added
    func notAdded(){
        userDefaults.set("NotAdded", forKey: addPreferenceKey)
    }
}
