//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var sendOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItem : ShoppingItem?
    var shoppingItemController: ShoppingItemController!
    let localNotificationHelper = LocalNotificationHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
    }
    
    private func updateViews() {
        sendOrderLabel.text = "You currently have \(shoppingItemController.items.filter({$0.added}).count) items."
    }
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            switch status {
            case .authorized:
                
                self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                
            case .denied:
                
                NSLog("User has denied authorization to receive local notifcations")
                
            case .notDetermined:
                
                self.localNotificationHelper.requestAuthorization(completion: { ( success) in
                    
                    guard success else { NSLog("User has deniced authorization to receive local nifications"); return }
                    
                    self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                })
                
            default:
                break
            }
        }
    }
    
}
    
//    private func showAlert() {
//        let alert = UIAlertController(title: "Delivery for \(String(describing: nameTextField.text))", message: "Your shopping items will be delivered to \(String(describing: addressTextField.text)) in 15 minutes.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }}
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


