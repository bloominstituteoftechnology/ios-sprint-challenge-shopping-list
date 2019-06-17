//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingListCellDelegate {
    
    

    let shoppingItemController = ShoppingItemController()
    
    var itemsInCart: [ShoppingItem] = []
    
    
    override func viewDidLoad() {
        collectionView?.delegate = self
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        collectionView!.reloadData()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkoutItems" {
            guard let checkoutVC = segue.destination as? CheckoutViewController else { return }
        checkoutVC.shoppingItemController = shoppingItemController
    }
    }

    // MARK: UICollectionViewDataSource

   


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let item = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItemName.text = item.name
        cell.itemImage.image = UIImage(named: item.name)
        cell.delegate = self
        if item.isOnList == true {
            cell.cartStatus.text = "Added"
        } else {
            cell.cartStatus.text = "Not in cart"
        }

        return cell
    }

    // MARK: UICollectionViewDelegate

 
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let item = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.addToCart(add: item)
        collectionView.reloadItems(at: [indexPath])
        print("Selected")
        print(shoppingItemController.itemsInCart)
    }
    
   
    
    private func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.shoppingList[indexPath.item]
        } else {
            return shoppingItemController.shoppingList[indexPath.item]
        }
    }
    

   
    
    @IBAction func unwindToShoppingListCollectionViewController(_ sender: UIStoryboardSegue) {
        
    }
    
    func toggleIfInShoppingCart(for cell: ShoppingItemCollectionViewCell) {
        
    }
 
    }


