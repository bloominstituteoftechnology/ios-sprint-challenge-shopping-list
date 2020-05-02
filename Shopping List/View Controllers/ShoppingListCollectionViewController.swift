//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Bronson Mullens on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingController = ShoppingController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FinishOrderSegue" {
            let finishOrderVC = segue.destination as? OrderScreenViewController
            finishOrderVC?.shoppingController = shoppingController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let shoppingItem = shoppingController.shoppingItems[indexPath.item]
        cell.item = shoppingItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemTapped = shoppingController.shoppingItems[indexPath.item]
        shoppingController.itemToggled(item: itemTapped)
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDelegate

}
