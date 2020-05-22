//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Ian Becker on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.identifier == "showDetailView" {
            guard let groceryItemVC == segue.destination as? GroceryItemDetailViewController else { return }
            
            groceryItemVC.delegate = self
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return shoppingListController.groceryItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItemCell", for: indexPath) as? GroceryItemCollectionViewCell else { fatalError("Collection view cell identifier is wrong or the cell is not a PlanetCollectionViewCell")}
    
        // Configure the cell
        
        let groceryItem = shoppingListController.groceryItems[indexPath.item]
        
        cell.
    
        return cell
    }
}
    // MARK: UICollectionViewDelegate

extension ShoppingListCollectionViewController: 
