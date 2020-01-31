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
   
    var delegate: [ShoppingItem]? {
        didSet {
            updateView()
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        }
    
    func updateView() {
        guard let count = delegate?.count else { return }
        self.listLabel.text = "You have \(count) item(s) in your shopping list."
    }
    
 

    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text, let count = delegate?.count else { return }
        let alert = UIAlertController(title: "Thank you, \(name) your order has been placed!", message: "You will have \(count) item(s) that will be sent to \(address).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
