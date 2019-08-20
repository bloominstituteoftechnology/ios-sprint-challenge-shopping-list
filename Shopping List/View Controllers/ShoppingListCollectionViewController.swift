//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    @IBOutlet weak var customCellView: UIView!
    
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNameAddressSegue" {
            if let orderItemsVC = segue.destination as? OrderItemsViewController {
                orderItemsVC.shoppingListController = self.shoppingListController
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as?
            ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingListController.shoppingItems[indexPath.item]
        cell.imageView.image = UIImage(named: item.name)
        cell.delegate = self
        
        return cell
    }
}

extension ShoppingListCollectionViewController: AddToShoppingListDelegate {
    func itemWasAdded(_ item: ShoppingItem) {
        guard let index = shoppingListController.shoppingItems.firstIndex(of: item)
            else { return }
        shoppingListController.updateIsAdded(item: index)
        collectionView?.reloadData()
    }
    
    
}
