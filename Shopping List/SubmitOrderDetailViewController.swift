//
//  SubmitOrderDetailViewController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderDetailViewController: UIViewController {
   
    
   
    var shoppingListController: ShoppingListController!
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       updateViews()
    }
    
    func updateViews() {
        
        let numberOfAdded = shoppingListController.items.filter({$0.addedToList}).count
        itemsInCartLabel.text = "You currently have \(numberOfAdded) in your shopping list."
    }


    @IBAction func submitOrderButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    private func showAlert() {
           
        let alert = UIAlertController(title: "Delivery for \(nameTextField?.text)", message: "Your shopping items will be delivered to \(addressTextField?.text).", preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           
           alert.addAction(okAction)
           
           present(alert, animated: true, completion: nil)
       }
    


    }


