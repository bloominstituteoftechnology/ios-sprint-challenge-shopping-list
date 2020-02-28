//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    var cartItemCount = 2
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func send(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var descriptionText = ""
        
        switch cartItemCount {
        case 0:
            descriptionText = "Your shopping list is empty."
        case 1:
            descriptionText = "You currently have \(cartItemCount) item in your shopping list."
        default:
            descriptionText = "You currently have \(cartItemCount) items in your shopping list."
        }
        
        descriptionLabel.text = descriptionText

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
