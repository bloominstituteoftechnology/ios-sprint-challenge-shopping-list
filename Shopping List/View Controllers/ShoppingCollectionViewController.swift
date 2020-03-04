//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           collectionView?.reloadData()
       }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "orderItemSegue" {
            guard let orderDetailVC = segue.destination as? ShoppingOrderViewController else { return }
            orderDetailVC.shoppingItemController = shoppingItemController
        }

        }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.newItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        let newItems = shoppingItemController.newItems[indexPath.item]
        cell.item = newItems
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           shoppingItemController.updateList(for: shoppingItemController.newItems[indexPath.item])
           collectionView.reloadData()
       }
}
