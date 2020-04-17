//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"
let shoppingItemController = ShoppingItemController()

class ShoppingListCollectionViewController: UICollectionViewController, ItemCollectionCellDelegate {
   
    func hasBeenSelected(for cell: ShoppingItemCollectionViewCell) {
        guard let item = cell.item else {return}
        shoppingItemController.updateIsSelected(for: item)
        collectionView?.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OrderSegue" {
            guard let destVC = segue.destination as? ShoppingDetailViewController else {return}

            destVC.shoppingItemController = shoppingItemController
            
        }
        
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        
        let item = shoppingItemController.items[indexPath.item]
        cell.item = item
        cell.delegate = self
    
        return cell
    }

   

}
