//
//  sendPurchaseViewController.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class sendPurchaseViewController: UIViewController {
    
    var shoppingListContorller: ShoppingItemController?

    @IBOutlet weak var itemsInCartLabel: UILabel!
    
    @IBOutlet weak var customerNameTextField: UITextField!
    
    @IBOutlet weak var customerDeliveryAddress: UITextField!
    
    @IBAction func submitOrderButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let shoppingListContorller = shoppingListContorller else {return}
        let purchaseList = shoppingListContorller.shoppingLists.filter {$0.addedItem == true}
        itemsInCartLabel.text = "You have added \(String(describing: purchaseList.count)) (s) in your shopping list"
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
