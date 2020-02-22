//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



// Mark :- IBOutlets


class ShoppingListCollectionViewController: UICollectionViewController {
    private var shoppingListController = ShoppingListController()

 
        


  

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    

}
