//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    @IBOutlet weak var shoppingListMessage: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func updateViews() {
        
        let numberOfItemsAdded = shoppingListController.items.filter( { $0.itemAdded}).count
    }
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        
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
