//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingController = ShoppingController()
    let localNotificationHelper = LocalNotificationHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

       collectionView?.reloadData()
    }

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "toOtherVC" {
            let vc = segue.destination as? OrderViewController

            vc?.shoppingController = shoppingController
            vc?.localNotificationHelper = localNotificationHelper
        }
    }
   

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCell", for: indexPath) as! ShoppingListCollectionViewCell
    
        let items = shoppingController.shoppingItems[indexPath.item]
        cell.shopping = items
        cell.delegate = self
        return cell
    }
    
    private func shoppingItemFor(indexPath: IndexPath) -> Shopping {
        
            return shoppingController.shoppingItems[indexPath.item]
    }

}

extension ShoppingListCollectionViewController: ShoppingCellDelegate {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else {return}
        let item = shoppingItemFor(indexPath: indexPath)
        shoppingController.toggleIsAdded(shoppingItem: item)
        collectionView?.reloadItems(at: [indexPath])
    }
    
    
}
