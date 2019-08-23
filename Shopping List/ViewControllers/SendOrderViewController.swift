//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    
    @IBOutlet weak var sendOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItem : ShoppingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sendOrderLabel.text = "You currently have \(shoppingItem) items in your shopping list."
        
    }
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Delivery for \(String(describing: nameTextField.text))", message: "Your shopping items will be delivered to \(String(describing: addressTextField.text))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
