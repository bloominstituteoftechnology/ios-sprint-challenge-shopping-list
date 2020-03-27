//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol DeliveryAlertDelegate {
    func showDeliveryAlert()
}

class CheckoutViewController: UIViewController {

    var cartController: CartController?
    var alertDeligate: DeliveryAlertDelegate?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func send(_ sender: Any) {
        var showAlert = false
        
        if let name = nameTextField.text,
            let address = addressTextField.text {
        
            cartController?.name = name
            cartController?.address = address
            
            showAlert = true
        }
        
        navigationController?.popViewController(animated: true)
        
        // TODO: Being paranoid. Want the dismiss first before I call this.
        // Not sure I'm happy with this. Given this will be a timed delay thing, maybe it's OK? Would prefer to "send a message" and not still be in this code during alert.
        if showAlert == true {
            alertDeligate?.showDeliveryAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var descriptionText = "Your shopping list is empty."
        
        if let cartController = cartController {
            switch cartController.numOfItemsInCart {
            case 0:
                descriptionText = "Your shopping list is empty."
            case 1:
                descriptionText = "You currently have \(cartController.numOfItemsInCart) item in your shopping list."
            default:
                descriptionText = "You currently have \(cartController.numOfItemsInCart) items in your shopping list."
            }
        }
        
        descriptionLabel.text = descriptionText
    }
}
