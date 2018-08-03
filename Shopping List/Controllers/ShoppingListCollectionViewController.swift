//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if it is the first run of the app
        checkUserDefaults()
        shoppingItemController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
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
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { fatalError("Not a ShoppingListCollectionViewCell")}
        
        // Configure the cell
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        
        
        return cell
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
    
    func checkUserDefaults() {
        let userDefaults = UserDefaults.standard
        let appHasBeenRunKey = userDefaults.bool(forKey: appHasBeenRun)
        
        if appHasBeenRunKey == false {
            print(appHasBeenRunKey)
            
            //First time running the app
            // Setup shopping list here then set userDefaults key!
            setupInitialShoppingList()
            userDefaults.set(true, forKey: appHasBeenRun)
        }
        
    }
    
    func setupInitialShoppingList() {
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            guard let image = UIImage(named: "\(item).png"),
            let imageData = UIImagePNGRepresentation(image) else { return }
            shoppingItemController.create(withImageData: imageData, named: item)
        }
    }
    
    let shoppingItemController = ShoppingItemController()
}
