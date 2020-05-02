//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

	let shoppingCell = ShoppingItemCollectionViewCell()
	
	
	
	
	@IBOutlet var orderSummaryLabel: UILabel!
	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var addressTextField: UITextField!
	
	var numberOfItemsSelected = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		orderSummaryLabel.text = "You have \(numberOfItemsSelected) item(s) in your order"

        // Do any additional setup after loading the view.
    }
    

	@IBAction func orderButtonTapped(_ sender: UIButton) {
		showAlert()
		nameTextField.text = nil
		addressTextField.text = nil
	}
	
	func showAlert() {
		guard let name = nameTextField.text else { return }
		guard let address = addressTextField.text else { return }
		let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
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
