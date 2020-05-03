//
//  ShoppingListDetialViewController.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetialViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendOrderTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
