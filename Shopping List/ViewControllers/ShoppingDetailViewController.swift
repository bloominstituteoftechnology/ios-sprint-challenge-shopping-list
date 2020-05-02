//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func sendOrderTapped(_ sender: Any) {
        
    }

}
