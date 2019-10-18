//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Jon Bash on 2019-10-18.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var numItemsLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let controller = shoppingItemController {
            numItemsLabel.text = "You currently have \(controller.cart.count) items in your cart."
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

    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        guard let name = nameField.text, !name.isEmpty,
            let address = addressField.text, !address.isEmpty,
            let cartCount = shoppingItemController?.cart.count, cartCount > 0
            else { return }
        
        let alert = UIAlertController(
            title: "Order received!",
            message: "Thanks, \(name). Your order will be delivered to \(address) in 15 minutes.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: postAlertPopToRoot(_:)))
            
        present(alert, animated: true, completion: nil)
    }
    
    private func postAlertPopToRoot(_ alert: UIAlertAction) {
        guard let items = shoppingItemController?.items else { return }
        for item in items {
            shoppingItemController?.update(item: item, to: false)
        }
        navigationController?.popToRootViewController(animated: true)
    }
}
