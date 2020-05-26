//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListDetailViewController: UIViewController {

    var shoppingItemController = ShoppingItemController()
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var userAddressTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var submitOrderButton: UIButton!
    
    @IBAction func tappedSubmitOrder(_ sender: Any) {
        showAlert()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
       func showAlert() {
        let alert = UIAlertController(title: "Order Successful!!!", message: "\(userNameTextField.text ?? " ") your order will be delivered to \(userAddressTextField.text ?? " ") in 15 mins", preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alert.addAction(okAction)
           present(alert,animated: true, completion: nil)
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
