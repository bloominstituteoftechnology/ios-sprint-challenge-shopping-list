//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Jordan Christensen on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet var itemsInCartLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    var numberOfItems: String? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let num = numberOfItems else { return }
//        itemsInCartLabel.text = "You currently have \(num) item(s) in your shopping cart" //Currently causes error
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text, let addr = addressTextField.text else { return }
        
            let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(addr)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
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
