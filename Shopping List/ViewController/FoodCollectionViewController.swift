//
//  FoodCollectionViewController.swift
//  Shopping List
//
//  Created by Sherene Fearon on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FoodCell"

class FoodCollectionViewController: UICollectionViewController, HasBeenAddedDelegate {
    func beenAddedTapped(cell: ItemCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = foodController.foodList[indexPath.item]
        foodController.itemAdded(item: shoppingItem)
        collectionView?.reloadData()
    }
    

    let foodController = FoodController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NewOrderViewController {
            destinationVC.foodController = foodController
        }
        
    
    
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foodController.foodList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        let item = foodController.foodList[indexPath.item]
        
        cell.shoppingItem = item
       
        cell.backgroundColor = .lightGray
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

   
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
   
}



