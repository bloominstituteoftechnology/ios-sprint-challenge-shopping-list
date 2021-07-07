//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Bradley Yin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
        let item = shoppingItemController.items[indexPath.item]
        cell.shoppingItem = item
    
        // Configure the cell
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingItemController.items[indexPath.item]
        if let index = shoppingItemController.items.index(where: {$0 == item}){
            shoppingItemController.items[index].hasAdded.toggle()
            shoppingItemController.saveToPersistentStore()
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderShowSegue"{
            guard let orderVC = segue.destination as? OrderViewController else {return}
            let newArray = shoppingItemController.items.filter({$0.hasAdded == true})
            print(shoppingItemController.items)
            orderVC.numberOfItems = newArray.count
        }
    }
}
