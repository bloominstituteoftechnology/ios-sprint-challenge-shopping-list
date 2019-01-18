//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shopcell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingController = ShoppingController()
    let listHelper = ListHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }

        
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "nextSegue":
            let nextVC = segue.destination as! ShoppingDetailViewController
            nextVC.shoppingController = shoppingController
        case "cellSegue":
            let nextVC = segue.destination as! ShoppingDetailViewController
            nextVC.shoppingController = shoppingController
        default:
            return
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopcell", for: indexPath)
        guard let unwrappedCell = cell as? ShoppingListCollectionViewCell else { fatalError("Cell could not be found")}
        
        let shoppingItem = shoppingController.shoppingList[indexPath.item]
        
        shoppingController.toggleAddedToList(on: indexPath.item)
        unwrappedCell.imageView.image = UIImage(data: shoppingItem.imageData)
        unwrappedCell.addedLabel.text = shoppingItem.addedToList ? "Added" : "Not Added"
        unwrappedCell.nameLabel.text = shoppingItem.name
        // Configure the cell
    
        return unwrappedCell
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
