//
//  ShoppingListViewController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {

    @IBOutlet weak var itemsOrderedLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
        
        
        let alert = UIAlertController(title: "\(name), your Order was sent!", message: "To \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
