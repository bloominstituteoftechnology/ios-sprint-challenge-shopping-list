//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController
{

    @IBOutlet weak var shopperNameTextField: UITextField!
    @IBOutlet weak var shopperAddressTextField: UITextField!
    @IBOutlet weak var confirmOrderButton: UIButton!
    
    var shoppingList: ShoppingItem?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmOrderButtonTapped(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
        showAlert()
    }
    
    func showAlert()
    {
        var alert = UIAlertController(title: "Order Confirmed", message: "Thank you \(shopperNameTextField.text)! We have recieved your order and we will be delivering it to \(shopperAddressTextField.text) within 15 minutes", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
