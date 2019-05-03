//
//  ShoppingItemViewController.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.itemNames.count
    }
    
    let shoppingItemController = ShoppingItemController() 

}
