//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"
private let sendOrderSegueIdentifier = "SendOrderSegue"

class ShoppingListCollectionViewController: UICollectionViewController {

    var shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case sendOrderSegueIdentifier:
            if let sendOrderVC = segue.destination as? SendOrderViewController {
                sendOrderVC.shoppingListController = self.shoppingListController
            }
        default:
            return
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else
        { return UICollectionViewCell() }
    
        // Configure the cell
        let item = shoppingListController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        shoppingListController.updateAddedToCart(for: shoppingItem)

        collectionView.reloadData()
    }
}
