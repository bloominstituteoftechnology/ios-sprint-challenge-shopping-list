//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    var shoppingController: ShoppingController?

    //MARK: - OUTLETS
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    //MARK: - ACTIONS
    @IBAction func sendOrderButton(_ sender: Any) {
    }
    
    func updateViews() {
        if let shoppingController = shoppingController {
           
        }
    }

}
