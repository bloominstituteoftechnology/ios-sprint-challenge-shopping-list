//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Vijay Das on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    var addedItems: [ShoppingItem]?
    
    
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBAction func printOrderTapped(_ sender: UIButton) {
        
        guard let addedItems = addedItems else { return }
        guard let name = nameField.text else { return }
        guard let address = addressField.text else { return }
        
        let printMessage = "\(name)'s order of \(addedItems) will  be delivered to \(address)"
        
        print(printMessage)
  
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
