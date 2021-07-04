//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrder" {
            guard let destinationVC = segue.destination as? PlaceOrderViewController else { return }
            destinationVC.orderTotal = shoppingItemController.updateTotal()
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.updateItemHasBeenAdded(shoppingItem: shoppingItemController.shoppingList[indexPath.item])
        collectionView.reloadItems(at: [indexPath])
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ShoppingListCollectionViewCell
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        return cell
    }


    //Mark: - Properties
    let shoppingItemController = ShoppingItemController()
    var shoppingItem: ShoppingItem?
}
