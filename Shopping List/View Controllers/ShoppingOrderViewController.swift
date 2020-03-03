//
//  ShoppingOrderViewController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingOrderViewController: UIViewController {
    @IBOutlet weak var itemCountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
  var itemInCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        guard let itemInCount = itemInCount else { return }
        itemCountLabel.text = "You currently have \(itemInCount) item(s) in your shopping list."
    }
    
    
    @IBAction func sendOrder(_ sender: Any) {
        let alert = UIAlertController(title: "Delivery for \(nameTextField.text!)!", message: "Your Delivery will be delivered to \(addressTextField.text!) in 15 minutes!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)

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
