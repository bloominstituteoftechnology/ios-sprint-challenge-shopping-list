//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Alexander Supe on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController, ShoppingCollectionViewCellDelegate {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - ShoppingCollectionViewCellDelegate
    
    func toggleHasBeenAdded(for cell: ShoppingCollectionViewCell) {
        cell.updateViews()
        collectionView?.reloadData()
        guard let index = shoppingItemController.shoppingItems.firstIndex(of: cell.shoppingItem!) else { return }
        shoppingItemController.updateIfAdded(for: shoppingItemController.shoppingItems[index])
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            guard let dest = segue.destination as? DetailsViewController else { return }
            dest.shoppingItemController = shoppingItemController
        } }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        cell.shoppingItem = shoppingItemController.shoppingItems[indexPath.row]
        return cell
    }
}
