//
//  CartViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

   var shoppingItemsController: ShoppingItemController?
    
    @IBOutlet weak var numberOfItemsTextLabel: UILabel!
    @IBOutlet weak var shopperNameTextField: UITextField!
    @IBOutlet weak var shopperAddressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
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
