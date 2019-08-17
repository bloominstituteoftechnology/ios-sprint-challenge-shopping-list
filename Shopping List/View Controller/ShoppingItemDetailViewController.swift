//
//  ShoppingItemDetailViewController.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemDetailViewController: UIViewController {
    
    
    @IBOutlet weak var shoppingItemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendOrderPressed(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
        !name.isEmpty,
        !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler: {
            action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true)
        
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
