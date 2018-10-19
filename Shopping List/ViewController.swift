//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
 import UserNotifications

class ViewController: UIViewController {

    
    
    var shoppingController: ShoppingController?
    
    
        override func viewWillAppear(_ animated: Bool) {
            showAddedItems()
        }

    
    func showAddedItems() {
        var string = ""
        guard let items = shoppingController?.shoppingItems else { return }
        for item in items {
         if item.added == true {
            let diffItem = "\(item.name)\n"
            string.append(diffItem)
        }
        
    }
    
    // MARK: - Notifications
    
    // gets authorization from the user to receive notifications (boilerplate)
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
        func scheduleNotification() {
        guard let name = name.text
        let address1 = address1.text
        let address2 = address2.text
    
       msg.title = "Your deliver is on its way"
      msg.body = "Your shopping will be delivered to your address in 15 minutes: \(address1.text ?? "" ), \(address2.text ?? "" )"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: msg, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var address1: UITextField!

    @IBOutlet weak var address2: UITextField!
    
    
    @IBAction func sendButton(_ sender: Any) {
       scheduleNotification()
      
        
        
    }
  
    
    
    


}
