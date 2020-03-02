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
        itemController.loadFromPersistentStore()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SendOrderSegue" {
            guard let orderVC = segue.destination as? OrderViewController else { return}
            orderVC.itemController = self.itemController
            
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
        
        let item = itemFor(indexPath: indexPath)
        
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
        
        itemController.saveToPersistentStore()
        self.collectionView?.reloadData()
    }
    
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
