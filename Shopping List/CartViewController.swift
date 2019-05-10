//
//  CartViewController.swift
//  Shopping List
//
//  Created by Christopher Aronson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class CartViewController: UIViewController {
    
    var numberOfItemsInCart: Int?

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let numberOfItems = numberOfItemsInCart else { return }
        
        if numberOfItems == 1 {
            itemsInCartLabel.text = "You currently have \(numberOfItems) item in your cart"
        } else {
            itemsInCartLabel.text = "You currently have \(numberOfItems) items in your cart"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addToCartButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let address = adressTextField.text else { return }
        
        let alert = UIAlertController(title: "Grocery", message: "Hi \(name)! Your groceries will be delivered to \(address) in 15 minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
