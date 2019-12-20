//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController
{
    
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItem.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingListCollectionViewCell else {return UICollectionViewCell()}
    
        // Configure the cell
        
        let shoppingItems = shoppingItemController.shoppingItem[indexPath.item]
        cell.shoppingItem = shoppingItems
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCartDetail"
        {
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first?.item,
            let selectShoppingCartVC = segue.destination as? ShoppingListDetailViewController else {return}
            
            let selectShoppingCart = shoppingItemController.shoppingItem[indexPath]
            selectShoppingCartVC.shoppingList = selectShoppingCart
            
        }
    }
}
