//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingCollectionViewController: UICollectionViewController {

    let itemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "orderItemSegue" {

        if segue.identifier == "orderItemSegue" {
            guard let orderDetailVC = segue.destination as? ShoppingOrderViewController else { return }
            orderDetailVC.itemCount = itemController.addedItems.count
        }
    }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.newItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCell", for: indexPath) as! ImageCollectionViewCell
        cell.item = itemController.newItems[indexPath.item]
        cell.delegate = itemController
        return cell
    }
}
