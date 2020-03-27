//
//  AddShoppingItemViewController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AddShoppingItemViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItemController: ShoppingItemController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addWatermelonButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "Watermelon")
        shoppingItemController?.addNewShoppingItem(name: "Watermelon")
    }
    
    @IBAction func addBreadButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "Bread")
        shoppingItemController?.addNewShoppingItem(name: "Bread")
    }
    
    @IBAction func addCherriesButtonTapped(_ sender: Any) {
        imageView.image = UIImage(named: "Cherries")
        shoppingItemController?.addNewShoppingItem(name: "Cherries")
    }
    
}
