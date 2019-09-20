//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    var numberOfAddedItems: Int?
    
    // MARK : - IBOutlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    // MARK: - IBAction Submit Button
    @IBAction func submitOrderButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "You currently have \(numberOfAddedItems) Item(s) in your shopping list.", message: "Your order will be sent to \(addressTextField.text) in 15 mins!", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
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
