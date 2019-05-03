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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = shoppingItemController.itemNames[indexPath.row]
        cell.textLabel.text = shoppingItem.text
        cell.imageView.image = shoppingItem.image
        
        return cell
        
    }
    let shoppingItemController = ShoppingItemController() 

}
