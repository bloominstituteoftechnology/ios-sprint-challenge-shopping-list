//
//  ShoppingListViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    // Mark:- IBOutlets/Properties
    var shoppingListController: ShoppingListController?
    var count: Int = 0

    @IBOutlet weak var shoppingListItemLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    // Marks:- IBActions
    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
        
        let notification = UIAlertController(title: "Delivery for \(name)", message: "Your items will be delivered to \(address) in 15 minutes", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Send", style: .default, handler: nil)
        notification.addAction(okAction)
        self.present(notification, animated: true, completion: nil)
        }
    
    private func updateViews(){
        for item in shoppingListController!.shoppingList {
            if item.addedOnTheShoppingList {
                count += 1
                
            }
            
        }
        shoppingListItemLabel.text = "You currently have \(count) items in your shopping list"
    }
        
        
        
    }
    

    


