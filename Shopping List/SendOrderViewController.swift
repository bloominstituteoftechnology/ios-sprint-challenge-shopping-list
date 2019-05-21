//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var addressField: UITextField!
    
    
    var shoppingItemController: ShoppingItemController?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        guard let numberOfItems = shoppingItemController?.addingCount() else { return }
//        orderLabel.text = "You currently have \(numberOfItems) items in your shopping list."
        var text = ""
        switch numberOfItems {
        case 0:
            text = "You currently have \(numberOfItems) items in your shopping list"
        case 1:
            text = "You currently have \(numberOfItems) item in your shopping list"
        case 2...10:
            text = "You currently have \(numberOfItems) items in your shopping list"
        default:
            text = "Error, cannot determine how many things you have in your shopping list."
        }
        orderLabel.text = text
    }
    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = nameField.text, let address = addressField.text    else { return }
        alert(userName: name, userAddress: address)
    }
    
    func alert(userName: String, userAddress: String){
        let alert = UIAlertController(title: "Alert message", message: "\(userName), your order will be delivered in 15 minutes to your address \(userAddress)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true) }))
        
        present(alert, animated: true, completion: nil)

}
}
