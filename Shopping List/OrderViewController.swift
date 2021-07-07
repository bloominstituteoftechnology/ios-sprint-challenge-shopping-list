//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Bradley Yin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class OrderViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    
    var numberOfItems = 0
    var name = ""
    var address = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = "You currenly have \(numberOfItems) item(s) in your shopping list"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitOrderTapped(_ sender: UIButton) {
        guard let name = nameTextfield.text, !name.isEmpty, let address = addressTextfield.text, !address.isEmpty else { return }
        self.name = name
        self.address = address
        
        checkAuth()
        
    }
    func checkAuth(){
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { (settings) in
            // Do not schedule notifications if not authorized.
            guard settings.authorizationStatus == .authorized else {return}
            self.setupNotif()
           
        }
    }
    func setupNotif(){
        
        // Configure the notification's payload.
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)"
        content.body = "Your shopping list items will be deliver to \(address) in 15 minutes"
        //content.sound = UNNotificationSound.default()
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
                print("error setting up notif \(theError)")
            }
        }
    }

    


}
