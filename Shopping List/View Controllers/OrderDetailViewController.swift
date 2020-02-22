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

    var itemCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        guard let itemCount = itemCount else { return }
        orderSummaryLabel.text = "You currently have \(itemCount) item(s) in your shopping list."
    }

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        
    }
}
