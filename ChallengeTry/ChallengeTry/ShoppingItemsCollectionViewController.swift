//
//  ShoppingItemsCollectionViewController.swift
//  ChallengeTry
//
//  Created by Ryan Murphy on 5/10/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingItemsCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.update(shoppingItem: shoppingItemController.shoppingItems[indexPath.item])
        collectionView.reloadItems(at: [indexPath])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         collectionView.reloadData()
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckOut" {
            guard let destinationVC = segue.destination as? ShoppingCartViewController else {return}
            destinationVC.shoppingItemController = shoppingItemController
        }
    }
 

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }
   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


   

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let shoppingItemCollectionCell = cell as? ShoppingItemCollectionViewCell else {
            print("Error in Cell type")
        return cell
    }
        shoppingItemCollectionCell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        return cell
}
    
    //for push
}
