//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var nameInCartLabel: UILabel!
    
    var shoppingListController = ShoppingListController()
    
    var itemsInCart: [ShoppingItem] {
        
        let items = shoppingListController.shoppingList
        
        let x = items.filter ({$0.addedToCart == true})
    
        return x
    }
    
    
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterAddressTextField: UITextField!

    
    @IBAction func sendOrderButton(_ sender: Any) {
        
        showAlert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInCartLabel.text = "You currently have \(itemsInCart.count) item(s) in your shopping list"
        // Do any additional setup after loading the view.
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
 func showAlert() {
    
    guard let name = enterNameTextField.text else {return}
    guard let address = enterAddressTextField.text else {return}
    
    if name == "" {
        
        let nilName = UIAlertController(title: "Error", message: "Name needed to place order ", preferredStyle: .alert)
        
        nilName.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        self.present(nilName, animated: true)
        
    } else if address == "" {
        
        let nilAddress = UIAlertController(title: "Error", message: "Address needed to place order ", preferredStyle: .alert)
        
        nilAddress.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        self.present(nilAddress, animated: true)
    } else {
    
    let alert = UIAlertController(title: "Thank You For Ordering", message: "\(name), your order will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    
    self.present(alert, animated: true)
        
        
    
    }
   
    

    }
}
