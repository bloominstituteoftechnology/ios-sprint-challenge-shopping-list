//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FruitCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    
    let shoppingListController = ShoppingListController()
    var shoppingList: ShoppingItem?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }

    @IBAction func nextButtomPressed(_ sender: Any) {
        
        
    }
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToOrderVC" {
            if let destinationVC = segue.destination as? OrderViewController {
                destinationVC.shoppingListController = shoppingListController
            }
        }
    }
    

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { fatalError() }
        
        let shoppingList = shoppingListController.shoppingList[indexPath.item]
        cell.shoppingList = shoppingList
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = shoppingListController.shoppingList[indexPath.item]
        item.hasBeenAdded.toggle()
        shoppingListController.shoppingList[indexPath.item] = item
        shoppingListController.saveToPresistentStore()
        collectionView.reloadData()
    }


}
