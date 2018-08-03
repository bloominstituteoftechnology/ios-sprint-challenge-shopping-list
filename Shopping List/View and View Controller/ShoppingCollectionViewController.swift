//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Andrew Liao on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemController.loadFromPersistenceStore()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count //Shopping list must have been created or something went horribly wrong
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCollectionViewCell else {return UICollectionViewCell()}
        
        cell.shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        return cell
    }
    
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemTapped = shoppingItemController.shoppingList[indexPath.row]
        shoppingItemController.toggleAddStatus(forItem: itemTapped)
        collectionView.reloadData()
    }

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrder"{
            guard let destinationVC = segue.destination as? CompleteOrderViewController else {return}
            
            destinationVC.shoppingItemController = shoppingItemController
        }
     }

    
    //Mark: - Properties
    let shoppingItemController = ShoppingItemController()
}
