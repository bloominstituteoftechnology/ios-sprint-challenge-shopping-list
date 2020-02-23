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
        let shoppingItem = shoppingController.shoppingItems[indexPath.item]
        shoppingController.toggleHasBeenAdded(for: shoppingItem)
        if let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell {
            cell.item = shoppingController.shoppingItems[indexPath.item]
        }
        collectionView.reloadData()
       // collectionView.reloadItems(at: [indexPath])
    }
        
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionElementKindSectionHeader) {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AddedHeader", for: indexPath) as? HeaderCollectionReusableView else { fatalError("Invalid view type") }
            // Customize headerView here
            var headerText = "Header"
            if indexPath.section == 0 {
                headerText = "Added to Shopping List"
            } else {
                headerText = "Not Added"
            }
            
            headerView.headerLabel.text = headerText
            return headerView
        }
        fatalError()
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
