//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingDetailViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    let localNotificationHelper = LocalNotifHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmOrder(_ sender: Any) {
        
        let center  = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if let error = error {
                NSLog("Error requesting auth for notifcations: \(error)")
            }
            
            
        }
        
        localNotificationHelper.requestAuthorization { (notificationsAllowed) in
            
        guard let name = self.nameField.text, let address = self.addressField.text else {return}
            
            if notificationsAllowed {
                
                self.localNotificationHelper.scheduleOrderNotification(with: name, and: address)
                self.navigationController?.popViewController(animated: true)
            } else {
                return
            }
            
           
        }
    }
    
}
