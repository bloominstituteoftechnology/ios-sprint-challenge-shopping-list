//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBOutlet weak var orderName: UITextField!
    
    @IBOutlet weak var orderAddress: UITextField!
    
    @IBAction func submitOrder(_ sender: UIButton) {
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Your Order Has Been Submitted", message: "\(String(describing: orderName.text)), your order will be delivered in 15 minutes to \(String(describing: orderAddress.text))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
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
    
}
