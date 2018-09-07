//
//  NewOrderFromItemsViewController.swift
//  Shopping List
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class NewOrderFromItemsViewController: UIViewController, UNUserNotificationCenterDelegate {

    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        updateViews()
        
        // When I'm not on a time crunch,
        // refactor this helper alert call into it's own
        // helper class 😇
        localNotificationHelper.getAuthorizationStatus { (status) in
            if status != .authorized {
                self.localNotificationHelper.requestAuthorization { (wasSuccessful) in
                    if !wasSuccessful {
                        // Alert controller setup
                        let alert = UIAlertController(title: "🚨 We can't send you shipment notifications currently",
                                                      message: "Please turn on notifications to be able to receive order updates at anytime.",
                                                      preferredStyle: .alert)
                        
                        // Actions
                        let goToAction = UIAlertAction(title: "Show Settings", style: .default) { (action) in
                            if let url = URL(string: "app-settings:") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                        
                        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
                        
                        alert.addAction(goToAction)
                        alert.addAction(cancel)
                        
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge])
    }
    
    
    // Trigger view updates
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        
        var shoppingList = Array(shoppingItemController.addedItems)
        
        if shoppingList.count > 1 {
            let endIndex = shoppingList.endIndex - 1
            shoppingList.remove(at: endIndex)
            
            var shoppingListString = ""
            for item in shoppingList {
                shoppingListString.append("\(item.name), ")
            }
            shoppingListString.append("\(shoppingItemController.addedItems[endIndex].name)")
            
            shoppingCartListLabel.text = shoppingListString
            title = "Ordering \(shoppingItemController.addedItems.count) items"
            
        } else {
            
            shoppingCartListLabel.text = shoppingItemController.addedItems.first?.name ?? ""
            title = "Ordering 1 item"
        }
    }
    
    
    // If both name and address are complete, submit the order and trigger
    // delivery notifications
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = billingAddressTextView.text,
            let itemCount = shoppingItemController?.addedItems.count else { return }
        
        if name == "" || address == "" { return }
        
        triggerOrderNotification(with: name, address: address, itemCount: itemCount)
        
        view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- Properties
    let localNotificationHelper = LocalNotificationHelper()
    var shoppingItemController: ShoppingItemController?
    
    // MARK:- IBOutlets
    @IBOutlet weak var shoppingCartListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var billingAddressTextView: UITextView!
    @IBOutlet weak var sendOrderBarButtonItem: UIBarButtonItem!
    
}

extension NewOrderFromItemsViewController {
    
    func triggerOrderNotification(with name: String, address: String, itemCount: Int) {
        
        let identifier = "OrderNotification"
        
        let content = UNMutableNotificationContent()
        content.title = "📦 \(name), your delivery is almost here!"
        content.body = itemCount > 1 ? "\(itemCount) items will be delivered to \(address) in 30 minutes!" : "1 item will be delivered to \(address) in 30 minutes!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                NSLog("Error triggering notification: \(error)")
            }
        }
    }
    
}
