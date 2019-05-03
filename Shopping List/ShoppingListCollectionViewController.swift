//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ShoppingListCollectionViewCell
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        
        cell.imageView.image = shoppingItem.image
        cell.nameLabel.text = shoppingItem.name
        
        if shoppingItem.added == true {
            cell.itemAddedLabel.setTitle("Added", for: .normal)
            cell.itemAddedLabel.setTitleColor(.green, for: .normal)
        } else {
            cell.itemAddedLabel.setTitle("Not Added", for: .normal)
            cell.itemAddedLabel.setTitleColor(.red, for: .normal)
        }
        
        
        
        
        
        return cell
    }
    
    

}
