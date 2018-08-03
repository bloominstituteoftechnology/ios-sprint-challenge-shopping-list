//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    // MARK: - Properties
    
    var shoppingItemController: ShoppingItemController?
    
    let localNotificationHelper = LocalNotificationHelper()
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        
        localNotificationHelper.requestAuthorization() { (success) in
            if success  == true {
                self.localNotificationHelper.scheduleDailyReminderNotification()
            }
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        localNotificationHelper.getAuthorizationStatus() { (success) in
//            self.localNotificationHelper.scheduleDailyReminderNotification()
//            }
//        }
//    }
//
    
    
    

}
