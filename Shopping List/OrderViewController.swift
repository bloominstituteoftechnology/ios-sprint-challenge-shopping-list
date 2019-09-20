//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Dennis on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderViewLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterAddressTextField: UITextField!
    
    
    
    
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func showAlert() {
        if let address = enterAddressTextField.text {
           
        
        
        let alert = UIAlertController(title: "Order", message: "Your order will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
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
}
