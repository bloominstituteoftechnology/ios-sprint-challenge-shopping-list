//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    

    func updateViews() {
        guard let shoppingListController = shoppingListController else { return }
        
        let shoppingListCount = shoppingListController.addedItems.count
        
        titleLabel.text = "You currently have \(shoppingListCount) item(s) in your shopping list."
    }

    // MARK: - IBActions
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        
    }

}
