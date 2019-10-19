//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    var shoppingItemController: ShoppingItemController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func submitOrderButton(_ sender: Any) {
        
        let custName = nameLabel.text!
        let custAddress = addressLabel.text!
        
        let alert = UIAlertController(title: "Thank you for your order", message:
        "Hi \(custName)!\n Your order has been received and will be delivered to:\n\(custAddress)\n in 15 minutes!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    private func updateViews() {
        guard let items = shoppingItemController?.shoppingList else { return }
        var addedCount: Int = 0
        
        for item in items {
            if item.isAdded {
                addedCount += 1
            }
        }
        
        if addedCount == 1 {
            itemCount.text = "You've added (\(addedCount)) item to your order.  Please complete the information below to submit your order."
        } else {
            itemCount.text = "You've added (\(addedCount)) items to your order.  Please complete the information below to submit your order."
        }
        
    }
    


        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
