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
        
        func showAlert() {
            let alert = UIAlertController(title: "Thankyou For Ordering", message: "\(String(describing: enterNameTextField.text)) your oder will be delivered in 15 minutes to \(String(describing: enterAddressTextField.text))", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInCartLabel.text = "You currently have \(itemsInCart.count) item(s) in your shopping list"
        // Do any additional setup after loading the view.
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
