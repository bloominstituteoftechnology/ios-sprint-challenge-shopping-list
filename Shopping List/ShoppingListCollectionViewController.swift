//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
   

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
        
        let item = self.shoppingItemController.shoppingItems[indexPath.row]
//        cell.toggleLabel.text
        cell.shoppingItem = item
//        cell.imageView.image = UIImage(named: item.itemName)
        cell.delegate = self
//         cell.toggleLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        // Configure the cell
        
//        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
       
        return cell
    }
    
//    @objc func tap(_ sender: UITapGestureRecognizer) {
//
//        let location = sender.location(in: self.collectionView)
//        let indexPath = self.collectionView.indexPathForItem(at: location)
//
//        if let index = indexPath {
//
//            print("Got clicked on index: \(index)!")
//
//        }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
//        shoppingItemController.toggleAdd(shoppingItem: shoppingItem)
//            collectionView.reloadData()
//        }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEnterOrder" {
            guard let destinationVC = segue.destination as? SendOrderViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    
    
    }
}

    

extension ShoppingListCollectionViewController: ShoppingListCollectionViewCellDelegate {
    func buttonWasPressed(on cell: UICollectionViewCell) {
        
        guard let index = collectionView?.indexPath(for: cell) else { return }
        
        let item = shoppingItemController.shoppingItems[index.item]
        
        shoppingItemController.toggleAdd(shoppingItem: item)
        
        collectionView?.reloadItems(at: [index])
    }
}

    
    


