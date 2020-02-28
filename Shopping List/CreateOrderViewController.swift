//
//  CreateOrderViewController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class CreateOrderViewController: UIViewController {

    
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var shoppingItemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let shoppingItemController = shoppingItemController else { return }
        
        shoppingListLabel.text = "You currently have \(shoppingItemController.shoppingList.count) item(s) in your shopping list."
        
    }

    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }

        alert(name: name, address: address)
    }
    
    @IBAction func sendOrderNotification(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }

        registerLocal()
        scheduleLocal(name: name, address: address)
    }
    
    
    func alert(name: String, address: String) {
        
        let alert = UIAlertController(title: "Ordered", message: "Thank you for your order, \(name). It will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("granded")
            } else {
                print("Not granted")
            }
        }
    }
    
    func scheduleLocal(name: String, address: String) {

        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Ordered"
        content.body = "Thank you for your order, \(name). It will be delivered to \(address) in 15 minutes."
        content.categoryIdentifier = "Alarm"
        content.sound = .default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)

    }
    
    
}





