//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"
private let newOrderSegueIdentifier = "NewOrder"
private let newShoppingItemSegueIdentifier = "NewItem"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK:- Lifecycle methods
    // Refresh collection view data when the view reappears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation methods
    // Inject data as a storyboard segue is being performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // PREPARE FOR SEGUE
    }

    
    // MARK:- UICollectionViewDataSource methods
    // Number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    
    // Items per section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return shoppingItemController.addedItems.count
        } else if section == 1 { return shoppingItemController.notAddedItems.count
        } else { return 0 }}
    
    
    // Shopping item cell for the current index item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        
        return cell
    }
    
    
    // MARK:- Properties
    let shoppingItemController = ShoppingItemController()
    
}
