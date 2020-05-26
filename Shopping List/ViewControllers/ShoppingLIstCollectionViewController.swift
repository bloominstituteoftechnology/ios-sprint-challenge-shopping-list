//
//  ShoppingLIstCollectionViewController.swift
//  Shopping List
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCollectionViewCell"

class ShoppingLIstCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "AddItemShowSegue" else { return }
        
        let sendOrderVC = segue.destination as? SendOrderViewController
        sendOrderVC!.shoppingItemController = shoppingItemController
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SHoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemController.items[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingItemController.items[indexPath.row]
        shoppingItemController.updateHasSeen(forShoppingItem: item)
        collectionView.reloadItems(at: [indexPath])
    }

}
