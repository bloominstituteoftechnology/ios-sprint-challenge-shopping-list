//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()
    var shoppingListDetailViewController = ShoppingListDetailViewController()

    var shoppingItemCollectionViewCell = ShoppingItemCollectionViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemCollectionViewCell.updateViews()

        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // Do any additional setup after loading the view.
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShoppingListDetailSegue" {
            
        let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController
            shoppingListDetailVC?.shoppingItemController = shoppingItemController
                return 
            }
//            shoppingListDetailVC.delegate = self
        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("Collection view cell identifier is wrong or the cell is not a ShoppingItemCollectionViewCell")
        }
    
        // Configure the cell
        let shoppingListItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.imageView.image = shoppingListItem.image
        cell.shoppingItemLabel.text = shoppingListItem.imageName
        if shoppingListItem.added == true {
            cell.hasBeenAddedLabel.text = "Added"
        } else {
            cell.hasBeenAddedLabel.text = "Not Added"
        }
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShoppingItemCollectionViewCell
        var chosenItem = shoppingItemController.shoppingItems[indexPath.item]
        chosenItem.added.toggle()
        cell.hasBeenAddedLabel.text = chosenItem.added ? "Added" : "Not Added"
        print(chosenItem.added)
        func onSelectedAddCart(with item: ShoppingItem) {
            shoppingListDetailViewController.shoppingItem.append(item)
            
        }
        }
        
        

}
