//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    
    let shoppingContoller = ShoppingController()
    var shoppingList: ShoppingList?
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addressSegue" {
            guard let destinationVC = segue.destination as? ShoppingDetailViewController else { return }
            destinationVC.shoppingController = shoppingContoller
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingContoller.shoppingList.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingList = shoppingContoller.shoppingList[indexPath.row]
        
        cell.shoppingList = shoppingList
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        print("Cell \(indexPath.row) selected")
        let myShoppingList = shoppingContoller.shoppingList[indexPath.row]
        shoppingContoller.toggleBool(myshoppingList: myShoppingList.self)
        collectionView.reloadData()
        //        print(myShoppingList)
        //        print(shoppingContoller.shoppingList[indexPath.row])
    }

}
