//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet var numberOfItemsInCart: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendOrderPressed(_ sender: UIButton) {
        showAlert()
        
        
        
    }
    
    

    func showAlert() {
       
        if nameTextField.text != nil && addressTextField.text != nil {
            let alert = UIAlertController(title: "Delivery for \(String(describing: nameTextField.text))", message: "Your order will be delivered to \(String(describing: addressTextField.text)) in 15 minutes.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else if nameTextField.text == nil || addressTextField.text == nil {
            func showAlert() {
                let alert = UIAlertController(title: "Missing Information!", message: "Please complete the information in each field.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
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

}
