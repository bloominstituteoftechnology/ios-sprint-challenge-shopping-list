//
//  ShoppingItemViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController {
	
	var shoppingListController: ShoppingListController?

	@IBOutlet weak var numberOfItemsAdded: UILabel!
	@IBOutlet weak var usersName: UITextField!
	@IBOutlet weak var usersAddress: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
 
	@IBAction func sendOrder(_ sender: Any) {
		
	}
	
}
