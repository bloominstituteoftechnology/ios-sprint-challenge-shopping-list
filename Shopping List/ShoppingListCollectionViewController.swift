//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sezen Bozdogan on 15.11.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shoppingItem: ShoppingItem? {
               didSet {
                   updateViews()
               }
        
}
