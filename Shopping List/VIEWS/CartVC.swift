//
//  CartVC.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    
    //collectionView?.delegate = self  // SUNDAY/MONDAY edit
    
    
/*   experimenting to get rid of latency issue with toggled add/not-add button
     override func viewererDidLoad() {
     super.viewDidLoad()
     }
*/
    
    override func viewWillAppear(_ animated: Bool) {
        
        cartMessageLabel.text = "You currently have \(skuController.cartCount()) items in your shopping list"
    }
    
    

    @IBAction func sendOrderButtonPressed(_ sender: Any) {
    
        let alert = UIAlertController(title: "ShoppingList would like to send you Notifications", message: "in order to help process your order", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Allow", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        //alert.addAction(<#T##action: UIAlertAction##UIAlertAction#>)    must add another action for the "Don't Allow" button
        
        self.present(alert, animated: true, completion: nil)
        
        let alert2 = UIAlertController(title: "ShoppingList would like to send you Notifications", message: "Notifications may include...", preferredStyle: .alert)
        /*
         alert2.addAction(UIAlertAction(title: "DIS-Allow", style: <#T##UIAlertActionStyle#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
         */
        
    }
    
   // PROPERTIES
    @IBOutlet weak var cartMessageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var addedCount: Int?
    
    var skuController = SkuController()
    var sku: Sku?
}
