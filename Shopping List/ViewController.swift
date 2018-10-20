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
        updateViews()
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
    }
    // MARK: - Notifications

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
        self.requestAuthorization(completion:{
            if !$0 {return}
            let msg = UNMutableNotificationContent()
            msg.title = "Your deliver is on its way"
            msg.body = "Your shopping will be delivered to your address in 15 minutes: \(self.address1.text ?? "" ), \(self.address2.text ?? "" )"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: msg, trigger: trigger)
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request)
        })
        
    
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViews() {
    
        let addeditems = shoppingController?.shoppingItems.filter( {$0.added})
        name.text = "You currently have \(addeditems?.count ?? 0) item(s) in your shopping cart"
    }
    
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var address1: UITextField!
    
    @IBOutlet weak var address2: UITextField!
    
    
    @IBAction func sendButton(_ sender: Any) {
        scheduleNotification()
        
        
        
    }
    
   
    
}



