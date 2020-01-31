//
//  OrderViewController.swift
//  Shopping List
//
//  Created by beth on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBOutlet weak var orderName: UITextField!

       @IBOutlet weak var orderAddress: UITextField!

       @IBAction func submitOrder(_ sender: UIButton) {
           showAlert()
       }
    
    var shoppingListController = ShoppingListController()
    //var addedItems: ShoppingItem?

    
    func showAlert() {
        let alert = UIAlertController(title: "Your Order Has Been Submitted", message: "\(String(describing: orderName.text)), your order will be delivered in 15 minutes to \(String(describing: orderAddress.text))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
     // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        orderLabel.text = "You have \(shoppingListController.addedItems.count) item(s) in your cart"
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
