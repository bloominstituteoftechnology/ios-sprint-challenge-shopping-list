//
//  makeOrderViewController.swift
//  Shopping List
//
//  Created by Alex Thompson on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MakeOrderViewController: UIViewController {
    
    @IBOutlet weak var basketLabelCount: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var basket: [ShoppingItems] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        basketLabelCount.text = "Your basket currently has (\(basket.count)) items"

    }
    
    @IBAction func placeOrderTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Your order has been succesfully placed", message: "Hi, \(name), your order has been placed succesfully and will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
   
}
