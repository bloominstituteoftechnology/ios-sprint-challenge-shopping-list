//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var itemCount: Int?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemCount = itemCount else { return }
        textLabel.text = "You currently have \(itemCount) items in your shopping list."
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        let alert = UIAlertController(title: "Delivery for \(nameField.text ?? "name not found")", message: "Your shopping list will be delivered to \(addressField.text ?? "address not found")", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
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
