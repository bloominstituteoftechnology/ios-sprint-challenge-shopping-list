//
//  AddressViewController.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    var shoppingController: ShoppingController?
    var  shoppingItem: ShoppingItem?
    
    @IBOutlet weak var noticeLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        showAlert()
      
    }
    
    private func showAlert() {
        guard let nameText = nameText else {return}
        guard let addressText = addressText else {return}
        
        let alert = UIAlertController(title: "Dear \(nameText)", message: "Your order  is arriving at \(addressText)", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
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
