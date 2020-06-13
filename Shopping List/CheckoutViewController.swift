//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Gladymir Philippe on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var numberItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let controller = shoppingItemController {
            numberItemsLabel.text = "You currently have \(controller.cart.count) items in your cart."
            nameTextField.text = controller.name
            addressTextField.text = controller.address
        }
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty,
        let cartCount = shoppingItemController?.cart.count, cartCount > 0 else { return }
        
        shoppingItemController?.saveDefaults(name: name, address: address)
        
        let alert = UIAlertController(
            title: "Order received!",
            message: "Thanks, \(name). Your order will be delivered to \(address) in 15 minutes.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: postAlertPopToRoot(_:)))

        present(alert, animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func postAlertPopToRoot(_ alert: UIAlertAction) {
           guard let items = shoppingItemController?.items else { return }
           for item in items {
               shoppingItemController?.update(item: item, to: false)
           }
           navigationController?.popToRootViewController(animated: true)
       }
    
    
}
