//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfItems: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list"
    }
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "\(nameTextField.text ?? "unknown")", message: "Order will be delivered in 15 minutes at \(addressTextField.text ?? "unknown").", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
    }
}



