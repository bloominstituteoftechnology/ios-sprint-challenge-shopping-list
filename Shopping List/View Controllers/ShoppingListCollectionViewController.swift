//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Niranjan Kumar on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
     
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()
        updateViews()
        shoppingListController.saveToPersistentStore()
    }
    
    // MARK: - Loading From UserDefaults:
    
    private func updateViews() {
        
        let userDefaults = UserDefaults.standard.bool(forKey: "ShoppingList")
        
    }
    
    
    

    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let orderVC = segue.destination as? OrderViewController else { return }
//            orderVC.shoppingItem =
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell()}
        
        let item = shoppingListController.items[indexPath.row]
        cell.delegate = self
        cell.item = item
        
        return cell
    }

}
