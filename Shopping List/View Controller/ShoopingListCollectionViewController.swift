//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    let shoppinItemController = ShoppingItemController()
    
    // MARK: - Functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: - Seperate section
    
    func shoppingItemSections(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppinItemController.added[indexPath.item]
        } else {
            return shoppinItemController.notAdded[indexPath.item]
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NextBarButtonSegue" {
            guard let destionationVC = segue.destination as? SendOrderViewController else { return }
            destionationVC.shoppingItemController = shoppinItemController
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppinItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppinItemController.shoppingList[indexPath.item]
        
        cell.shoppingItemImage.image = UIImage(data: item.imageData)
        cell.shoppingItemNameLabel.text = item.name
        
        if item.hasBeenAdded {
            cell.statusLabel.text = "Added"
        } else {
            cell.statusLabel.text = "Not Added"
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppinItemController.shoppingList[indexPath.item]
        shoppinItemController.changeStatus(for: item)
        collectionView.reloadItems(at: [indexPath])
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return }
//        
//        guard let name = cell.shoppingItemNameLabel.text,
//              let image = cell.shoppingItemImage.image,
//              let data = UIImageJPEGRepresentation(image, 1.0) else { return }
//        
//        if cell.isSelected {
//            if shoppinItemController.shoppingList.isEmpty {
//                shoppinItemController.addShoppingList(itemName: name, imageData: data, hasBeenAdded: true)
//            } else {
//                let shoppingItem = shoppinItemController.shoppingList[indexPath.item]
//                shoppinItemController.removeFromShoppingList(item: shoppingItem)
//                shoppinItemController.changeStatus(for: shoppingItem)
//            }
//            
//        }
//    }
    
    // MARK: - Delegate
    
//    func heyAddedButtonTapped(for cell: ShoppingListCollectionViewCell) {
//        guard let index = collectionView?.indexPath(for: cell),
//              let title = cell.shoppingItemNameLabel.text,
//              let image = cell.shoppingItemImage.image,
//              let data = UIImageJPEGRepresentation(image, 1.0) else { return}
//
//        if shoppinItemController.shoppingList.isEmpty {
//            shoppinItemController.addShoppingList(itemName: title, imageData: data, hasBeenAdded: true)
//            cell.addedButtonOutlet.setTitle("Added", for: .normal)
//            let count = shoppinItemController.shoppingList.count
//            cell.countLabel.text = "(\(count))"
//        } else {
//
//            if title == item.name {
//                let item = shoppinItemController.shoppingList[index.item]
//                shoppinItemController.removeFromShoppingList(item: item)
//                shoppinItemController.changeStatus(for: item)
//                cell.addedButtonOutlet.setTitle("Not Added", for: .normal)
//                let count = shoppinItemController.shoppingList.count
//                cell.countLabel.text = "(\(count))"
//            } else {
//                shoppinItemController.addShoppingList(itemName: title, imageData: data, hasBeenAdded: true)
//                cell.addedButtonOutlet.setTitle("Added", for: .normal)
//                let count = shoppinItemController.shoppingList.count
//                cell.countLabel.text = "(\(count))"
//            }
//        }
//    }
}
