//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    //MARK: - Properties
    let shoppingController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    
    //MARK: - IBOutlet
    @IBAction func NextButtonTapped(_ sender: Any) {
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrderSegue" {
            let addOrderVC = segue.destination as! ShowOrderViewController
            addOrderVC.shippingController = shoppingController
            
        }
    }


    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return shoppingController.addedItems.count
        } else {
            return shoppingController.notAddedItems.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let item = getShoppingItem(for: indexPath)
        cell.item = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = getShoppingItem(for: indexPath)
        
        shoppingController.toggleHasBeenAdded(for: shoppingItem)
        collectionView.reloadData()

    }
    
    
    // MARK: - Functions
    
    func getShoppingItem(for indexPath: IndexPath) -> ShoppingItem {
        let shoppingItem: ShoppingItem
        if indexPath.section == 0 {
            shoppingItem = shoppingController.addedItems[indexPath.item]
        } else {
            shoppingItem = shoppingController.notAddedItems[indexPath.item]
        }
        return shoppingItem
    }

}
