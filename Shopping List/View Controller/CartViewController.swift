//
//  CartViewController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var labelItemCounter: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //Variables
    var shoppingController: ShoppingCartController?

    @IBAction func buttonSendOrder(_ sender: UIButton) {
        let alert = UIAlertController(title: "Your Order Will Be Delivered in 15 minutes!", message: "\(textFieldName.text ?? "No Name")'s order will be delivered to \(textFieldAddress.text ?? "No Address")", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    
    //Functions
    func updateViews() {
        var inShoppingCart = 0
        if let myItems = shoppingController?.shoppingItems {
            for i in myItems {
                if i.hasBeenAdded == true {
                    inShoppingCart += 1
                }
            }
        }
        labelItemCounter.text = "You currently have \(inShoppingCart) items in your shopping list!"
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
