//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol DeliveryAlertDelegate {
    var deliveryAlert: Bool { get set }
    var delayInSeconds: Int { get set }
}

class CheckoutViewController: UIViewController {

    var cartItemCount = 2
    var cartController: CartController?
    var alertDeligate: DeliveryAlertDelegate?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func send(_ sender: Any) {
        if let name = nameTextField.text,
            let address = addressTextField.text {
        
            cartController?.name = name
            cartController?.address = address
            
            alertDeligate?.deliveryAlert = true
            alertDeligate?.delayInSeconds = 5
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var descriptionText = ""
        
        switch cartItemCount {
        case 0:
            descriptionText = "Your shopping list is empty."
        case 1:
            descriptionText = "You currently have \(cartItemCount) item in your shopping list."
        default:
            descriptionText = "You currently have \(cartItemCount) items in your shopping list."
        }
        
        descriptionLabel.text = descriptionText
    }
}
