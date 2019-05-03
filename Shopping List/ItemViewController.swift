//
//  ItemViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
	
	var itemCollectionViewCell : ItemCollectionViewCell?
	var shoppingListController =  ShoppingListController()
	var item: Item?
	var numberOfItemsInCart: Int?
	
	@IBOutlet weak var itemsadded: UILabel!
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var address: UITextField!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		guard let numberOfItems = numberOfItemsInCart else { return }
		
		if numberOfItems == 1 {
			itemsadded.text = "You currently have \(numberOfItems) item in your cart"
		} else {
			itemsadded.text = "You currently have \(numberOfItems) items in your cart"
		}
	}

	
}
