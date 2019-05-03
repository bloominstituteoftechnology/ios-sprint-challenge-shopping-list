//
//  OrderingViewController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderingViewController: UIViewController {
    
    // MARK: - Properties and Outlets
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingController: ShoppingItemController?
    
    // MARK: - View Loading Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItems = shoppingController?.shoppingItems else { return }
        var numOfItems = 0
        
        for item in shoppingItems {
            if item.isAdded {
                numOfItems += 1
            }
        }
        
        orderLabel.text = "You have \(numOfItems) item(s) in your shopping cart."
    }
    
    // MARK: - Action Methods
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        
        
        let alert = UIAlertController(title: "\(name)", message: "Your order will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
    }

}
