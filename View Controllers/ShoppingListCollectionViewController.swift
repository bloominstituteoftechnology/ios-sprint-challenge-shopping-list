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
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkoutVC = segue.destination as? CheckoutViewController else { return }
        checkoutVC.items = itemsInCart
    }
   

    // MARK: UICollectionViewDataSource

   


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingCart.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let item = shoppingItemController.shoppingCart[indexPath.item]
        cell.shoppingItemName.text = item.name
        cell.cartStatus.text = "Not in cart"
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
        
        
        let cell: ShoppingItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
            toggleIfInShoppingCart(for: cell)
//        if cell.isSelected {
//        cell.shoppingItem?.isOnList.toggle()
//        print("Selected")
//        if cell.shoppingItem?.isOnList == true {
//            cell.cartStatus.text = "Added"
//            itemsInCart.append(cell.shoppingItem!)
//        } else {
//            cell.cartStatus.text = "Not in cart"
//        }
//        print(itemsInCart)
//            collectionView.reloadItems(at: [indexPath])
//        }
//        else {
//            return
//        }
        
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell: ShoppingItemCollectionViewCell = collectionView.cellForItem(at: indexPath) as! ShoppingItemCollectionViewCell
//        cell.delegate?.toggleIfInShoppingCart(for: cell)
//        if cell.shoppingItem?.isOnList == false {
//            cell.cartStatus.text = "Not in cart"
//            numberOfItemsInCart -= 1
//        } else {
//            cell.cartStatus.text = "Added"
//        }
//        collectionView.reloadData()
//        print(numberOfItemsInCart)
//    }
    
    private func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.shoppingCart[indexPath.item]
        } else {
            return shoppingItemController.shoppingCart[indexPath.item]
        }
    }
    

   
    
    @IBAction func unwindToShoppingListCollectionViewController(_ sender: UIStoryboardSegue) {
        
    }
    

    
    func updateCart() {
//        if isInCart {
//            numberOfItemsInCart += 1
//        } else {
//            return
//        }
    }
    
   
    
    func toggleIfInShoppingCart(for cell: ShoppingItemCollectionViewCell) {
        guard let index = collectionView?.indexPath(for: cell) else { return }
        let item = shoppingItemController.shoppingCart[index.item]
        shoppingItemController.addToCart(add: item)
        collectionView?.reloadItems(at: [index])
        
        
//
//        cell.shoppingItem?.isOnList.toggle()
//        if cell.shoppingItem?.isOnList == true {
//            itemsInCart.append(cell.shoppingItem!)
//            numberOfItemsInCart = itemsInCart.count
//        } else if cell.shoppingItem?.isOnList == false {
//            if itemsInCart.contains(cell.shoppingItem!) {
//                itemsInCart.remove(at: itemsInCart.index(of: cell.shoppingItem!)!)
//                numberOfItemsInCart = itemsInCart.count
//            } else {
//                return
//            }
        }
    }


