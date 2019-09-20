//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var sendOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItem: ShoppingItem?
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
        
        localNotificationHelper.getAuthorizationStatus { (status ) in
            switch status {
            case .authorized:
                
                self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
            case .denied:
                
                NSLog("User has denied authorization to receive local notifications")
                
            case .notDetermined:
                
                self.localNotificationHelper.requestAuthorization(completion: { ( success) in
                    
                    guard success else { NSLog("User has denied authorization to receive local notifications"); return }
                    
                    self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                })
                
            default:
                break
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
