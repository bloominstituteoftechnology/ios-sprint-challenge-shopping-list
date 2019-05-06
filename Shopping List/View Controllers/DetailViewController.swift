//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var countOfPickedItems: Int = 0
    
    
    // MARK: - View states
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.navigationController?.navigationBar.topItem?.title = "Change Shopping List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        orderSummaryLabel.sizeToFit()
        orderSummaryLabel.text = "You currently have \(countOfPickedItems) item(s) in your shopping list."
    }
    
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        let alertMessageTitle = "Delivery for \(nameTextField.text ?? "Our Customer")"
        let alertMessage =
                """
                Your shopping items will be
                delivered to \(addressTextField.text ?? "the address on file")
                in 15 minutes.
                """
        
        // Set up the alert
        let alert = UIAlertController(title: alertMessageTitle, message: alertMessage, preferredStyle: .alert )
        
        // Select the action and present the alert
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
