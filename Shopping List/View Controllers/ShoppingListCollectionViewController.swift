//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // restructured CollectionViewController

    let reuseIdentifier = "cell"
    let notificationHelper = NotificationHelper()
    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        collectionView.backgroundColor = #colorLiteral(red: 0.6238838434, green: 0.6157867312, blue: 0.9108973145, alpha: 1)
    }

//    override var isSelected: Bool {
//            didSet{
//                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
//                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.1, y: 1.1) : CGAffineTransform.identity
//                }, completion: nil)
//
//            }
//        }
    
    // restructured Datasource
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return shoppingItemController.shoppingItems.count
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        shoppingItemController.update(shoppingItem: shoppingItem)
        collectionView.reloadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.layer.borderWidth = 1.5
        cell.backgroundColor = UIColor.yellow
        
        return cell
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "placeOrder" {
            guard let destinationVC = segue.destination as? PlaceOrderViewController else {return}
            
            destinationVC.shoppingItemController = shoppingItemController
            destinationVC.notificationHelper = notificationHelper
        }
    }
}

