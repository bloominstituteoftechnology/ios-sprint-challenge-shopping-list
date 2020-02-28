//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {

    let itemController = ShoppingItemController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemController.initValues
        itemController.loadFromPersistentStore()
        
        print(itemController.items.count)

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SendOrderSegue" {
            guard let orderVC = segue.destination as? OrderViewController else { return}
            orderVC.itemController = self.itemController
            print("Segue hit")
            
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return itemController.addedItems.count
        } else if section == 1 {
            return itemController.nonAddedItems.count
        }
        return itemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCollectionViewCell else {fatalError()}
        
        var item = itemFor(indexPath: indexPath)
        
        cell.item = item
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        /* Get the item that was tapped. Find that item in  */
        
        if indexPath.section == 0 {
            let item =  itemController.addedItems[indexPath.row]
            guard let itemIndex = itemController.items.firstIndex(of: item) else {return}
            itemController.items[itemIndex].isAdded.toggle()
        } else if indexPath.section == 1 {
            let item =  itemController.nonAddedItems[indexPath.row]
            guard let itemIndex = itemController.items.firstIndex(of: item) else {return}
            itemController.items[itemIndex].isAdded.toggle()
        }
        
//        itemController.items[indexPath.row].isAdded.toggle()
        itemController.saveToPersistentStore()
        self.collectionView?.reloadData()
    }
    
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return itemController.addedItems[indexPath.row]
        } else {
            return itemController.nonAddedItems[indexPath.row]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionTitleCollectionReusableView{
            if indexPath.section == 0 {
                sectionHeader.setionTitleLabel.text = "Added Items"
            } else {
                sectionHeader.setionTitleLabel.text = "Non-Added Items"
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
}
