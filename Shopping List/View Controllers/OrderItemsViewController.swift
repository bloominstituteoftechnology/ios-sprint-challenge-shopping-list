//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderItemsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        guard let orderName = nameTextField.text, let orderAddress = addressTextField.text,
            !orderName.isEmpty, !orderAddress.isEmpty else { return }
        
        dismiss(animated: true, completion: nil)
        let alertController = UIAlertController(title: "Delivery for \(orderName)!", message: "Your shopping items will be delivered to \(orderAddress) in 15 minutes!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func updateViews() {
        if let itemsCount = shoppingListController?.addedItems.count {
            titleLabel.text = "You currently have \(itemsCount) item(s) in your shopping list."
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

}
