//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "ShoppingListCell"

protocol sendListToOrderPage {
    func listIsSent(_: [ShoppingItem])
}
protocol addItemsDelegate {
    func itemIsAdded(_ item: ShoppingItem)
}

class ShoppingListCollectionViewController: UICollectionViewController, sendListToOrderPage {
    func listIsSent(_: [ShoppingItem]) {
    }
    
    var delegate: sendListToOrderPage?
    var shoppingItemController = ShoppingItemController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemController.fetchItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes - WAS CAUSING ERRORS
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ListCell")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
        collectionView?.reloadData()
      }
   
    
    // MARK: UICollectionViewDataSource
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

 override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ShoppingItemsCollectionViewCell else { return UICollectionViewCell() }
    let item = shoppingItemController.shoppingItems[indexPath.item]
    cell.shoppingItem = item
    return cell
   }
    
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//           return true
//       }
//
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? ShoppingItemsCollectionViewCell,
        let item = cell.shoppingItem else { return }
        shoppingItemController.update(for: item)
        collectionView.reloadData()
//        collectionView.reloadItems(at: [indexPath])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderConfirmationPageSegue" {
            guard let orderConfirmVC = segue.destination as? OrderConfirmationViewController else { return }
            orderConfirmVC.delegate = shoppingItemController.itemsAdded
        }
    }
    
    // MARK: UICollectionViewDelegate
}

extension ShoppingListCollectionViewController: ShoppingListDelegate {
    func toggleHasBeenAdded(forItem item: ShoppingItemsCollectionViewCell) {
        guard let shoppingItem = item.shoppingItem else { return }
        shoppingItemController.update(for: shoppingItem)
         collectionView?.reloadData()
    }
  }
    

