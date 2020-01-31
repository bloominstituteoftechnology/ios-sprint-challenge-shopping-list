//
//  DetailVC.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var totalItem = 0
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
            introLabel.text = "You currently have \(totalItem) items in you shoppling list."
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
//        let ac = UIAlertController(title: "Hi \(nameTextField.text ?? "")", message: "Your order will be delivered in 15 mins to \(addressTextField.text ?? "")", preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
//        present(ac,animated: true)
        
        setNotification()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    func setNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "You currently have \(totalItem) items in you shoppling list."
        content.body = "Hi \(nameTextField.text ?? "").Your order will be delivered in 15 mins to \(addressTextField.text ?? "")"
        content.sound = .defaultCritical
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let reguest = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
       
        
        center.add (reguest) { (error) in
            if error != nil {
                print("Error: \(error?.localizedDescription ?? "")")
            }
        }
        
        
    }
    
}
