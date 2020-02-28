//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var listSizeLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var itemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    @IBAction func orderButton(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressField.text else {return}
        
        let alert = UIAlertController(title: "Order Placed", message: "Order for \(name) will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func updateView() {
        guard let itemController = itemController else {return}
        listSizeLabel.text = "You currently have \(itemController.addedItems.count) in your shopping list."
    }
    
    

}
