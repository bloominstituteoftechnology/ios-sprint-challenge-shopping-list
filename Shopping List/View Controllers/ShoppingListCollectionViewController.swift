//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListItems()
    var items: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


//    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navController = segue.destination as? UINavigationController,
//            let detailVC = navController.viewControllers.first as? ShoppingListDetialViewController{
////            detailVC
//        }
//    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingListController.items[indexPath.item]
        cell.itemImageView.image = item.image
        cell.itemNameLabel.text = item.itemName
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        print("Stop here")
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let item = shoppingListController.items[indexPath.item]
        self.title = item.itemName
       }

}

//extension ShoppingListCollectionViewController: UITableViewDataSource, ItemCollectionViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    func wasAddedTapped(onCell cell: ShoppingListCollectionViewCell) {
//        <#code#>
//    }
//    
//
//}

