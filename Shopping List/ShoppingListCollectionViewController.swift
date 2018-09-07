//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingItemCollectionViewCellDelegate {
    func itemToggled(on cell: ShoppingItemCollectionViewCell) {
        guard let index = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = shoppingItemController.shoppingItems[index.item]
        shoppingItemController.toggleIsAdded(shoppingItem: shoppingItem)
        collectionView?.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }


 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SendOrder"){
            guard let destinationVC = segue.destination as? ShoppingListDetailViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
            destinationVC.localNotificationHelper = localNotificationHelper
        }
            
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.toggleIsAdded(shoppingItem: shoppingItem)
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        cell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.delegate = self
        // Configure the cell
        return cell
    }
    
    let shoppingItemController = ShoppingItemController()
    let localNotificationHelper = LocalNotificationHelper()


}
