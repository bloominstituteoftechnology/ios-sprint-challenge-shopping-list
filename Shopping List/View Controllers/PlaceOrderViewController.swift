//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    var shoppingItemController: ShoppingItemController?
    var notificationHelper = NotificationHelper()
    
    @IBOutlet weak var placeOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6238838434, green: 0.6157867312, blue: 0.9108973145, alpha: 1)
        updateViews()
        
    }
    
    @IBAction func placeOrderButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty,
            let numberOfItems = shoppingItemController?.shoppingItems.count
        else {return}
        notificationHelper.requestAuthorization { success in
            if success {
                self.notificationHelper.scheduleDelivery(name: name, address: address, numberOfItems: numberOfItems)
            } else {
                NSLog("There was an error with the notification")
        }
    }
    navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        //let numberOfItems = shoppingItemController.shoppingItems.count
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAdded})
        placeOrderLabel.text = "Enter your name and address for your \(numberOfItems.count) item(s)"
    }
        
}



