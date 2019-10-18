//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by morse on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func orderSent(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else { return }
        
    }
    
    private func updateViews() {
        guard let itemCount = itemCount else { return }
        
        itemsLabel.text = "You have \(itemCount) item(s) in your shopping list."
    }
    
    private func sendAlert(to name: String, at address: String) {
        print(name, address)
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
