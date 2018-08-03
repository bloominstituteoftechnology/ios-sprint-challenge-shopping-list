//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Andrew Liao on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
   override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? ShoppingHeaderCollectionReusableView{
            if indexPath.section == 0 {
                sectionHeader.headerLabel.text = "Items in Cart"
            } else {
                sectionHeader.headerLabel.text = "Items on Shelf"
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.shoppingCart.count
        } else {
            return shoppingItemController.itemsOnShelf.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCollectionViewCell else {return UICollectionViewCell()}
        
        cell.shoppingItem = itemAt(indexPath: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemTapped = itemAt(indexPath: indexPath)
        shoppingItemController.toggleAddStatus(forItem: itemTapped)
        collectionView.reloadData()
    }
    
    
    func itemAt(indexPath:IndexPath) -> ShoppingItem{
        if indexPath.section == 0 {
            return shoppingItemController.shoppingCart[indexPath.row]
        } else {
            return shoppingItemController.itemsOnShelf[indexPath.row]
        }
        
    }

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrder"{
            guard let destinationVC = segue.destination as? CompleteOrderViewController else {return}
            
            destinationVC.shoppingItemController = shoppingItemController
        }
     }

    
    //Mark: - Properties
    let shoppingItemController = ShoppingItemController()
}
