//
//  ShowOrderViewController.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShowOrderViewController: UIViewController {

    //MARK: - Properties
    var shippingController: ShoppingListController?
    
    //MARK: - IBOutlets
    @IBOutlet var itemsInCartLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Functions
    func updateViews() {
        //get the number of items and update the text label
        guard let numberOfItemsInCart = shippingController?.shoppingItems.filter({ return $0.addedToShoppingList}) else { return }
        
        itemsInCartLabel.text = "You currently have \(numberOfItemsInCart.count) item(s) in your shopping cart."
    }
    
    func showAlert() {
        //get the text for the alert
        guard let name = nameTextField.text, !name.isEmpty,
        let address = addressTextField.text, !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Order for \(name)", message: "Your order will be deliverd to \(address) in 15 minutes", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    

    //MARK: - IBActions
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    

}
