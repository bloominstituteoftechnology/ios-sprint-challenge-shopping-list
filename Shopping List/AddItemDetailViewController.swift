//
//  AddItemDetailViewController.swift
//  Shopping List
//
//  Created by Keri Levesque on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AddItemDetailViewController: UIViewController {

   
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
     
    @IBAction func sendOrderButton(_ sender: UIButton) {
        showAlert()
    }
    var shoppingListController =  ShoppingItemController()

    func showAlert() {
        let alert = UIAlertController(title: "Your Order Has Been Submitted", message: "\(String(describing: nameTextField.text!)), your order will be delivered in 15 minutes to \(String(describing: addressTextField.text!))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
     // Do any additional setup after loading the view.
    }

    func updateViews() {
        listLabel.text = "You have \(shoppingListController.addedItems.count) item(s) in your cart"
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


