//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var listSizeLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var itemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    @IBAction func orderButton(_ sender: Any) {
    }
    
    func updateView() {
        guard let itemController = itemController else {return}
        listSizeLabel.text = "You currently have \(itemController.addedItems.count) in your shopping list."
    }
    
    

}
