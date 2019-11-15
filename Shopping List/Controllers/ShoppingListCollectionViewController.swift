//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol listToNextView {
    func listIsSent(_: [ShoppingItem])
}

protocol addItemDelegate {
    func itemIsAdded(_ item: ShoppingItem)
}

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var delegate: listToNextView?
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: .cellID)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case String.addSegue:
            guard let addDetailVC = segue.destination as? AddItemDetailViewController else { return }
            addDetailVC.delegate = shoppingItemController.itemsAdded
        default:
            return
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .cellID, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.item = item
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.update(item: item)
        collectionView.reloadData()
    }
}

extension AddItemDetailViewController: listToNextView {
    func listIsSent(_: [ShoppingItem]) {
        
    }
}
