//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_101 on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingLIstCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
    
        // Configure the cell
        let item = shoppingListController.itemNames[indexPath.item]
        cell.imageView.image = item.image
        cell.itemNameLabel.text = item.itemName
    
        return cell
    }


    

}
