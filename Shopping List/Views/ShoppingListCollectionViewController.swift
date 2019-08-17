//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Joel Groomer on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingList = ShoppingList()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingList.notInList.count
        } else if section == 1 {
            return shoppingList.inList.count
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        if indexPath.section == 0 {
            cell.item = shoppingList.notInList[indexPath.item]
        } else {
            cell.item = shoppingList.inList[indexPath.item]
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ShoppingListSectionHeader", for: indexPath) as? ShoppingListCollectionReusableView
            else { fatalError("Couldn't dequeue header") }
        headerView.lblHeader.text = indexPath.section == 0 ? "On the shelf" : "In your cart"
        return headerView
    }

    
    // MARK: UICollectionViewDelegate


    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item: ShoppingItem
        if indexPath.section == 0 {
            item = shoppingList.notInList[indexPath.item]
        } else {
            item = shoppingList.inList[indexPath.item]
        }
        
        shoppingList.toggleListed(item: item)
        collectionView.reloadData()
        
        return false
    }

}
