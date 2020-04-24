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
        
        let alert = UIAlertController(title: "Delivery for: \(nameTextField.text)", message: "Your shopping list items will be delivered to \(addressTextField.text) in about 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    


}
