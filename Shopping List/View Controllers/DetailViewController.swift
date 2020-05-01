//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    @IBAction func sendOrderTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
        let address = addressTextField.text,
        !name.isEmpty,
        !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Delivery for: \(name)", message: "Your shopping list items will be delivered to \(address) in about 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func updateViews() {
        
        
        itemCountLabel.text = "You have in your cart."
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    
    
    


}
