//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var currentAmountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var shoppingController: ShoppingController?
    var localNotificationHelper: LocalNotificationHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         //let amount = shoppingController.totalInCart()
        guard let amount = shoppingController?.totalInCart() else { return }
        
        currentAmountLabel?.text = "You currently have \(amount) item(s) in your shopping list"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else {return}
        
       
        
        localNotificationHelper?.getAuthorizationStatus { (status) in
            switch status {
            case .authorized:
                self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
            case.notDetermined:
                self.localNotificationHelper?.requestAuthorization(completion: { (granted) in
                    if (granted) {
                        self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
                    }
                })
            default:
                return
            }
        }
        
    }
    
}

