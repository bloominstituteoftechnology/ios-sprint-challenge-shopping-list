//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Samuel Esserman on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//MARK: - Making the Key
extension String {
    static let isFirstRunKey = "ShoppingListIsFirstRunKey"
}
class ShoppingListCollectionViewController: UICollectionViewController {
    let itemNames = ["Apple",
                     "Grapes",
                     "Milk",
                     "Muffin",
                     "Popcorn",
                     "Soda",
                     "Strawberries"]
//MARK: - UserData
    var hasData: Bool {
        let setting = UserDefaults.standard.bool(forKey: .isFirstRunKey)
        
        if !setting {
            return false
        }
        return true
    }

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
        return itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell()}
        
        let item = ShoppingItem(name: itemNames[indexPath.item])
    
        cell.shoppingItem = item
    
        return cell
    }
//MARK: - Persistent = where we are saving
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let shoppingItemURL = documentsDirectory.appendingPathComponent("shoppingItems.plist")
        
        return shoppingItemURL
        
    }

    // MARK: UICollectionViewDelegate

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

}
