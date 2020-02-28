//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var listSizeLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var itemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func orderButton(_ sender: Any) {
    }
    
    
    

}
