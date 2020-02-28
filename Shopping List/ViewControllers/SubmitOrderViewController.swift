//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    
    //MARK: - IBActions
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        registerLocalNotification()
    }
    
    
    //MARK: - Properties
    
    var shoppingList: ShoppingList?
    
    
    //MARK: - Private
    
    private func registerLocalNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    self.scheduleLocalNotification()
                }
            } else {
                // Maybe we should show an alert instead if they don't authorize
                print("User denied authorization to schedule local notifications")
            }
        }
    }
    
    private func scheduleLocalNotification() {
        let center = UNUserNotificationCenter.current()
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return}
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)"
        content.body = "Your shopping items will be delivered to \(address) in 15 minutes!"
        content.sound = .default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request) { error in
            // Should we still show an alert here after scheduling a notification?
        }
        
        // Let user know order was placed by popping back to list
        navigationController?.popViewController(animated: true)
    }
    
    private func updateStatus() {
        guard let shoppingList = shoppingList else { return }
        statusLabel.text = "You currently have \(shoppingList.shoppingItemsOnList.count) items in your shopping list."
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addressTextField.delegate = self
        updateStatus()
    }
}

extension SubmitOrderViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let nameText = nameTextField.text,
            let addressText = addressTextField.text else { return }

        sendOrderButton.isEnabled = !nameText.isEmpty && !addressText.isEmpty
    }
}

