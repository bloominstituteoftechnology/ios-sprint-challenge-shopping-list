//
//  ShoppingOrderViewController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingOrderViewController: UIViewController {

    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!

    var shoppingItemController = ShoppingItemController()
    
  
    


    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
               guard let name = nameTextField.text, let address = addressTextField.text else { return }
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be deliverd to \(address) in 15 minutes", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
        navigationController?.popViewController(animated: true)

    }
    
    var shoppingItem: ShoppingItem?{
          didSet{
              updateViews()
          }
      }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews(){
        orderSummaryLabel.text = "You currently have \(shoppingItemController.addedItems.count) item(s) in your shopping list"
          
      }
}

