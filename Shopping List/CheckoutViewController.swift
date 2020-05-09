//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Alex on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    // MARK: Constants

    let shoppingListController = ShoppingListController()
    
    // MARK: Outlets & Actions

    @IBOutlet var myLbl: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    @IBAction func sendOrderBtnPressed(_ sender: UIButton) {
        if nameTextField.text != nil && addressTextField.text != nil {
            createAlert()
        }
    }

    // MARK: Overrides

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myLbl.text = "You currently have \(shoppingListController.shoppingList.count) item(s) in your shopping list."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Functions
    
    func createAlert() {
        let alert = UIAlertController(title: "Hi \(nameTextField.text!)!", message: "Your order will be delivered to \(addressTextField.text!) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
