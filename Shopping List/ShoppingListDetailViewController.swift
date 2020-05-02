//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by user162867 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    var shoppingItems: [ShoppingItem]?
    
    var delegate: [ShoppingItem]?
    
    var cartCount: Int? {
        return shoppingItems?.count
    }

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var cartCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateView() {
        guard let itemCount = delegate?.count else { return }
        self.cartCountLabel.text = "You currently have \(itemCount) item(s) in your shopping list! :)"
    }
    
    @IBAction func changeShoppingListButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let name = name.text, let address = address.text else { return }
            
        let alert = UIAlertController(title: "Thanks, \(name)! Your order has been placed in the queue!", message: "Delivery will be in 20 minutes to \(address)!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    
        updateView()
        navigationController?.popViewController(animated: true)
        
    
    }
}
