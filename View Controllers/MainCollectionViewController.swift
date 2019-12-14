//
//  MainCollectionViewController.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

extension String {
    static var cell = "CollectionViewCell"
    static var addSegue = "NextButtonSegue"
}

class MainCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    var delegate: nextView
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: .cell)

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .cell, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
    
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.item = item
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case String.addSegue:
            guard let addDetailVC = segue.destination as? SubmitOrderViewController else { return }
            addDetailVC.delegate = shoppingItemController.addedItems
        default:
            return
        }
    }
}
