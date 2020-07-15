//
//  DetailVC.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  //MARK:- IBOutlets
  
  @IBOutlet private weak var introLabel: UILabel! { didSet {introLabel.text = "You currently have \(shopController.addedItems.count) items in you shoppling list."}}
  @IBOutlet private weak var nameTextField: UITextField! { didSet { nameTextField.becomeFirstResponder() }}
  @IBOutlet private weak var addressTextField: UITextField!
  @IBOutlet private weak var sendOrderButton: UIButton!
  
  //MARK:- Properties
      
  // Implicitly unwrap optional
  var shopController: ShopplingListController!
  
  //MARK:- Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.addTarget(self, action: #selector(textFieldDidChanged), for:.editingChanged )
    addressTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    
    sendOrderButton.isUserInteractionEnabled = false
   
  }
  
 //MARK:- Helper
  @objc private func textFieldDidChanged(textfield: UITextField) {
    if nameTextField.hasText && addressTextField.hasText {
      sendOrderButton.isUserInteractionEnabled = true
    }
  }
  
  
  //MARK:- Actions
  @IBAction func sendOrderTapped(_ sender: UIButton) {
    
    setNotification(title: "You currently have \(shopController.addedItems.count) items in you shoppling list.",
                    body: "Hi \(nameTextField.text ?? "Nick").Your order will be delivered in 15 mins to \(addressTextField.text ?? "1 Hacker Way")")
    navigationController?.popViewController(animated: true)
    
    // Reset the items to not-added after finish sending the orders.
    shopController.addedItems.forEach { shopController.toggleHasBeenAdded(for: $0) }
  }
  
  private func setNotification(title: String, body: String ) {
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .defaultCritical

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    center.add (request) { error in
      if let error = error {
        print("Error: \(error.localizedDescription)")
      }
    }
  }
}


