//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		guard let itemsInCartCount = itemsInCartCount else { return }
		countLabel.text = "You Curently have \(itemsInCartCount) items in your shopping cart."
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	
	@IBOutlet var countLabel: UILabel!
	var itemsInCartCount: Int?
}
