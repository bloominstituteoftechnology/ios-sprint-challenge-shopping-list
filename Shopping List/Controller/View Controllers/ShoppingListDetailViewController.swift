//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var shoppingListNumberLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var shoppingController: ShoppingItemController?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Configuration
    /// Function to set up the views for the scene.
    private func updateViews() {
        guard let items = shoppingController?.items.filter( { $0.hasBeenAdded } ) else { return }
        if items.count == 1 {
            shoppingListNumberLabel.text = "You currently have 1 item in your\n shopping list."
        } else {
            shoppingListNumberLabel.text = "You currently have \(items.count) items in your\n shopping list."
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Helper Methods
//    private func showGroceryAlert(name: String, address: String) {
//        let alert = UIAlertController(title: "\(name)'s items are on the way", message: "Items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
//            guard let self = self else { return }
//            self.navigationController?.popViewController(animated: true)
//        })
//        present(alert, animated: true)
//    }
    
    /// Function to schedule a local notification
    /// - Parameters:
    ///   - name: User's input name
    ///   - address: User's input address
    private func sendGroceryNotification(name: String, address: String) {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Delivery for \(name)", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Your shopping items will be delivered to \(address) in 15 minutes!", arguments: nil)
        let components = Calendar.current.dateComponents([.minute], from: Date().addingTimeInterval(120))
        
        let request = UNNotificationRequest(identifier: "GroceryDelivery", content: content, trigger: UNCalendarNotificationTrigger(dateMatching: components, repeats: false))
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                break
            case .notDetermined:
                center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if granted {
                        return
                    }
                }
            default:
                break
            }
        }
        
        center.add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func sendOrderWasTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
//        showGroceryAlert(name: name, address: address)
        sendGroceryNotification(name: name, address: address)
        navigationController?.popViewController(animated: true)
    }
}
