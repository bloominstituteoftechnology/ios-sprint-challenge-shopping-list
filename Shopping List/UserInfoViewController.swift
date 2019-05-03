//
//  UserInfoViewController.swift
//  Shopping List
//
//  Created by Kobe McKee on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerAddressTextField: UITextField!
    
    @IBAction func submitOrderPressed(_ sender: Any) {
        guard let customerName = customerNameTextField.text,
            let customerAddress = customerAddressTextField.text
            else { return }
        showAlert(customerName: customerName, customerAddress: customerAddress)
        
        
    }
    
    func showAlert(customerName: String, customerAddress: String) {
        let alert = UIAlertController(title: "Delivery", message: "Your items will be delivered to \(customerName) at \(customerAddress) in 15 minutes. ", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    


}
