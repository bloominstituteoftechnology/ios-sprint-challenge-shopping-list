//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Eoin Lavery on 19/08/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    @IBOutlet weak var basketQuantityLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var basket: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basketQuantityLabel.text = "Your basket currently has \(basket.count) items."
    }
    
    @IBAction func placeOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text,
                let address = addressTextField.text,
                !name.isEmpty,
                !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Order Placed Successfully", message: "Hi, \(name), your order has been placed succesfully, and will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
