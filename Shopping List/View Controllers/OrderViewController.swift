//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    @IBAction func submitWasTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thank you, \(String(describing: nameTextField.text))!", message: "Your items will be delivered to \(String(describing: addressTextField.text)) in the next 15 minutes.", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
    }
}
