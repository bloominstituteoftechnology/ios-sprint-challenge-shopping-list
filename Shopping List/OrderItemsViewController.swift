//
//  OrderItemsViewController.swift
//  Shopping List
//
//  Created by Kenneth Jones on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderItemsViewController: UIViewController {
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabel()
    }
    
    @IBAction func orderSubmitted(_ sender: Any) {
        showAlert()
    }
    
    func updateLabel() {
        numberOfItemsLabel.text = "You currently have \(itemCount) item(s) in your shopping list."
    }
    
    private func showAlert() {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            name != "", address != "" else {
                let alert = UIAlertController(title: "We're missing something!", message: "You must enter a name and an address.", preferredStyle: .alert)
                    
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    
                alert.addAction(okAction)
                    
                self.present(alert, animated: true, completion: nil)
                return
        }
        
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.navigationController?.popViewController(animated: true)
        })
            
        alert.addAction(okAction)
            
        self.present(alert, animated: true, completion: nil)
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
