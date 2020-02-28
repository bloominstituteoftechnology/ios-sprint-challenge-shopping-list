//
//  ItemsDetailViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsDetailViewController: UIViewController, UINavigationControllerDelegate {

    var item: ShoppingItem?
    var shoppingContoller: ShoppingListController?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func sendOrder(_ sender: Any) {
        
        alert(name: nameLabel, address: addressLabel)
        
        if let name = nameLabel.text
        let address = addressLabel.text {
            
            shoppingContoller?.itemNames = name
            shoppingContoller?.address = address
            
            alert = true 
        }
    }
    
    // Shopping List Notifications
    
    func alert(name: String, address: String, minutes: Int = 15) {
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in  \(minutes)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
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
