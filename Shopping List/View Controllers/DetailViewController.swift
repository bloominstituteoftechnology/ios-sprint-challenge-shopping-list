//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Matthew Martindale on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cartInfoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        if let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty {
        let alert = UIAlertController(title: "Order Received", message: "Thank you \(name)! Your order will be delivered to \(address)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        navigationController?.popViewController(animated: true)
        } else {
            print("no good boy")
        }
        
    }
    

}
