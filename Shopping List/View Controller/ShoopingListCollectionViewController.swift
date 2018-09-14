//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingListCollectionViewCellDelegate {

    // MARK: - Properties
    
    var shoppinItemController: ShoppingItemController?
    
    // MARK: - Functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NextBarButtonSegue" {
            guard let destionationVC = segue.destination as? SendOrderViewController else { return }
            destionationVC.shoppingItemController = shoppinItemController
            
            guard let count = shoppinItemController?.shoppingList.count else { return }
            let text = "You currently have \(count) items in your shopping list"
            
            destionationVC.shoppingInfoLabel.text = text
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppinItemController!.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        guard let item = shoppinItemController?.itemNames[indexPath.item] else { return cell }
        
        cell.shoppingItemImage.image = UIImage(named: item)
        cell.shoppingItemNameLabel.text = item
        cell.shoppingListCVCellDelegate = self
        
        return cell
    }

    // MARK: Delegate
    
    func heyItemAddedToList(for cell: ShoppingListCollectionViewCell) {
        guard let name = cell.shoppingItemNameLabel.text,
              let image = cell.shoppingItemImage.image,
              let data = UIImageJPEGRepresentation(image, 1.0),
              let index = collectionView?.indexPath(for: cell) else { return }
        
        let item = shoppinItemController?.shoppingList[index.item]
        
        if item == nil {
            shoppinItemController?.addShoppingList(itemName: name, imageData: data, hasBeenAdded: true)
            shoppinItemController?.changeStatus(for: item!)
            cell.addButtonOutlet.setTitle("Added", for: .normal)
        } else if item != nil {
            shoppinItemController?.removeFromShoppingList(item: item!)
            cell.addButtonOutlet.setTitle("Not Added", for: .normal)
        }
    }

}
