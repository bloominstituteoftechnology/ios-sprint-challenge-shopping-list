//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {

    //MARK: - OVERRIDE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    //MARK: - Properties
    let listController = ListController()
    
    //MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = listController.sortedShoppingList[indexPath.item]
        cell.imageView.image = UIImage(data: shoppingItem.image)
        cell.nameLabel.text = shoppingItem.name
        if shoppingItem.beenAdded {
            cell.beenAddedLabel.text = "Added"
        } else {
            cell.beenAddedLabel.text = "Not Added"
        }
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = listController.sortedShoppingList[indexPath.item]
        listController.switchAddedToShoppingList(item: shoppingItem)
        collectionView.reloadData()
    }
    
    //MARK: - SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowDetails":
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC?.listController = listController
        case "AddItem":
            let destinationVC = segue.destination as? AddItemViewController
            destinationVC?.listController = listController
        default:
            break
        }
    }
    
    
}
