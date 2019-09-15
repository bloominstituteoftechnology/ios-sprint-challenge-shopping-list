//
//  OrderConfirmationViewController.swift
//  Shopping List New
//
//  Created by Uptiie on 9/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var itemsAddedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = nameLabel.text,
            let address = addressLabel.text else { return }
        
        let alert = UIAlertController(title: "delivered to \(name)", message: "Items will be delivered to \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func updateViews() {
        guard let items = shoppingItemController?.orderedItems.count else { return }
        itemsAddedLabel.text = "You have \(items) items in your cart."
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
