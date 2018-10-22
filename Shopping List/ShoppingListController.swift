// ShoppingListController.swift
//  Lotanna iOS3 Sprint 2 Challenge begins!

import UIKit
import Foundation

class ShoppingListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // restructured CollectionViewController
    
    let mynotifier = Notifier()
    let itemControllerReference = ItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemControllerReference.groceryList.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = itemControllerReference.groceryList[indexPath.item]
        
        itemControllerReference.updateGroceries(singleItem: shoppingItem)
        collectionView.reloadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groceryCell", for: indexPath) as! itemProtoCell
        
        let shoppingItem = itemControllerReference.groceryList[indexPath.item]
        cell.groceryItem = shoppingItem
        
        return cell
    }
    
    
    //Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderNotify" {
            guard let nextViewController = segue.destination as? GetNotifiedController else {return}
            
            nextViewController.myItemController = itemControllerReference
            nextViewController.mynotifier = mynotifier
        }
    }
}

