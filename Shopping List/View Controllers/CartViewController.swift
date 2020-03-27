//
//  CartViewController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var labelItems: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var buttonSendOrder: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
           
        updateViews()
    }
    
    //Variables
    var shoppingItems: [ShoppingItem?] = []
        
    //Functions
    func updateViews() {
        var inShoppingCart = 0
        for i in shoppingItems {
            if i?.inShoppingList == true {
                inShoppingCart += 1
            }
        }
        labelItems.text = "You currently have \(inShoppingCart) Items in your shopping list!"
    }
    
    @IBAction func SendOrder(_ sender: UIButton) {
        let alert = UIAlertController(title: "Your Order Will Be Delivered in 15 minutes!", message: "\(textFieldName.text ?? "No Name") order will be delivered to \(textFieldAddress.text ?? "No Address")", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
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
