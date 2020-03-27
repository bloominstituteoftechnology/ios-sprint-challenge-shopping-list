//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Shawn James on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Model Controller Reference Property
    
    let shoppingItemController = ShoppingItemController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == .segueIdentifier {
            // Get the new view controller using [segue destinationViewController].
            guard let shoppingCartViewController = segue.destination as? ShoppingCartViewController else { fatalError("failure to downcast segue destination")}
            // Pass the selected object to the new view controller.
            // FIXME: - pass shopping shoppingitemcontroller to destination's shopping list
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { shoppingItemController.shoppingItems.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { fatalError("failure to dequeue cell") }
        // Configure the cell
        // FIXME: - add configuration
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = shoppingItemController.shoppingItems[indexPath.item]
        item.isAdded.toggle()
        shoppingItemController.shoppingItems[indexPath.item] = item
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }
    
}

extension String {
    static let reuseIdentifier = "ShoppingListCell"
    static let segueIdentifier = "CheckoutSegue"
}
