//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    var itemsInCart: [ShoppingItem] = []
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        collectionView!.reloadData()
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
        return shoppingItemController.shoppingCart.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let item = shoppingItemController.shoppingCart[indexPath.item]
        cell.shoppingItemName.text = item.name
        cell.cartStatus.text = "Not in cart"
        cell.itemImage.image = UIImage(named: item.name)
        if item.isOnList == true {
            cell.cartStatus.text = "Added"
        } else {
            cell.cartStatus.text = "Not in cart"
        }

        return cell
    }

    // MARK: UICollectionViewDelegate

   



//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }

//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//
//    }
//
    
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        let addedItem = itemFor(indexPath: indexPath)
        shoppingItemController.addToCart(add: addedItem)
        toggleIfInShoppingCart(for: collectionView.cellForItem(at: indexPath) as! ShoppingItemCollectionViewCell)
        print(shoppingItemController.shoppingList)
        collectionView.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    private func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.shoppingCart[indexPath.item]
        } else {
            return shoppingItemController.shoppingCart[indexPath.item]
        }
    }
    
    private func selectedItem(item: ShoppingItem) -> UICollectionViewCell {
        if itemFor(indexPath: shoppingItemController.shoppingCart.index(of: item)) {
            
        }
    }
    
    @IBAction func toggleCartStatus(_ sender: UIButton) {
        toggleIfInShoppingCart(for: collectionView(UICollectionView, cellForItemAt: index))
        
    }
    
    @IBAction func unwindToShoppingListCollectionViewController(_ sender: UIStoryboardSegue) {
        
    }
    
//    @IBAction func updateCart(_ sender: Any) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(sender.isSelected, forKey: .shouldBeOnListKey)
//    }
    
//    private func updateViews() {
//        let userDefaults = UserDefaults.standard
//    }

}

extension ShoppingListCollectionViewController: ShoppingListCellDelegate {
    func toggleIfInShoppingCart(for cell: ShoppingItemCollectionViewCell) {
        cell.shoppingItem?.isOnList.toggle()
        if cell.shoppingItem?.isOnList == true {
            itemsInCart.append(cell.shoppingItem!)
        } else if cell.shoppingItem?.isOnList == false {
            if itemsInCart.contains(cell.shoppingItem!) {
                itemsInCart.remove(at: itemsInCart.index(of: cell.shoppingItem!)!)
            } else {
                return
            }
        }
    }
    
    
}
