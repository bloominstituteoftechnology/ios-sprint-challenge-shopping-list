//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let shoppingController = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("Couldn't get ShoppingItemCollectionViewCell") }
    
        let shoppingItem = shoppingController.items[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingController.items[indexPath.item]
        shoppingController.updateItem(item: shoppingItem)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let addedItemsCount = shoppingController.addedItemsCount()
            guard let detailVC = segue.destination as? ShoppingListDetailViewController else { return }
            detailVC.addedItemsCount = addedItemsCount
        }
    }
}

