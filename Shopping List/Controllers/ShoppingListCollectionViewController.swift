//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol sendListToNextView {
    func listWasSent(_: [ShoppingItem])
}

protocol addItemDelegate {
    func itemWasAdded(_ item: ShoppingItem)
}

class ShoppingListCollectionViewController: UICollectionViewController {
    
    
    

    let itemController = ItemController()
    
    var delegate: sendListToNextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 
        

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return ShoppingListCollectionViewCell()}
    
        let item = itemController.shoppingItems[indexPath.item]
        cell.item = item
        
        return cell
    }
    
    @IBAction func selectionToggled(_ sender: UIButton) {
        if  sender.titleLabel?.text == "Selected" {
            sender.setTitle("Not Selected", for: .normal)
            itemController.removeShoppingItem()
            
        } else if sender.titleLabel?.text == "Not Selected" {
            sender.setTitle("Selected", for: .normal)
            itemController.addShoppingItem(item: ShoppingItem(name: "Strawberries"))
            
        }
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "sendItemsToNewView", sender: self)
        let list = itemController.shoppingItems
        delegate?.listWasSent(list)
    }
    
    func sendToItemList(item: ShoppingItem) {
        itemController.addShoppingItem(item: item)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendItemsToNewView" {
            if let vc = segue.destination as? AddDetailViewController {
                vc.delegate = itemController.addedItems
            }
        }
    }

}

extension AddDetailViewController: sendListToNextView {
    func listWasSent(_ list: [ShoppingItem]) {


        
    }
    
    
}

