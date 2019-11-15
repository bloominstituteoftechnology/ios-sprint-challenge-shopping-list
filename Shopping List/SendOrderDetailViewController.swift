//
//  SendOrderDetailViewController.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 10/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderDetailViewController: UIViewController {
    @IBOutlet weak var cartStatementLabel: UILabel!
    @IBOutlet weak var nametextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var sendAlertButton: UIButton!
    var shoppinglistController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

      if let controller = shoppinglistController {
      cartStatementLabel.text = "you currently have \(controller.cart.count) items in your cart"
        
      
          }
        
        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//    }
//
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendOrderTapped(_ sender: Any){
        
   
    let alert = UIAlertController(title: "Your Order", message: "Your Order Is Being Prepared & Sent To Your Address", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
     }
}
