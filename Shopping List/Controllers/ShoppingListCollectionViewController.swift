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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.update(withShoppingItem: shoppingItem)
        collectionView.reloadData()
    }
    
    
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
