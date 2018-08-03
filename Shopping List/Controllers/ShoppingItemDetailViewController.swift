//
//  ShoppingItemDetailViewController.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingItemDetailViewController: UIViewController {
    
    var shoppingItem : ShoppingItem?
    
    let localNotificationHelper = LocalNotificationHelper()
    
    
    @IBOutlet weak var shoppingLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // send notification
    
    @IBAction func sendButton(_ sender: Any) {
        localNotificationHelper.requestAuthorization { (success) in
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: .notification, sender: nil)
            }
            self.localNotificationHelper.scheduleDailyReminderNotification()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            
            switch status {
                
            case .authorized: do {
                self.performSegue(withIdentifier: .notification, sender: nil)
                }
                
            case .denied: do {
                NSLog("User denied authorization access")
                }
                
            case .notDetermined: do {
                NSLog("User authorization status is undetermined")

                }
            }
        }
    }

}
