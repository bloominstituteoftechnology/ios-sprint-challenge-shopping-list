//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Chad Parker on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        
    }
}
