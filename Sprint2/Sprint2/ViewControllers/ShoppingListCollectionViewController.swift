//
//  ShoppingListCollectionViewController.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController, ItemCollectionCellDelegate {

    let shoppingController = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()


        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)


    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.

        if segue.identifier == "toDetailSegue" {
            guard let DetailVC = segue.destination as? DetailViewController else { return }

            DetailVC.shoppingController = shoppingController
        }
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        guard let itemCell = cell as? ItemCollectionViewCell else { return cell }
        let item = shoppingController.shoppingItems[indexPath.item]
        itemCell.itemLabel.text = item.name
        itemCell.imageView.image = UIImage(named: item.name)
        itemCell.delegate = self

        if shoppingController.shoppingItems[indexPath.row].isliked == false {
            itemCell.likeButton.setTitle("Not Added", for: .normal)
        } else {

                itemCell.likeButton.setTitle("Add", for: .normal)
            }
    
        return itemCell
    }


// DUPLICATE FUNCTION FOR CELL DELEGATE
/*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemsFor(indexPath: indexPath)
        shoppingController.toggleHasBeenLiked(shoppingItem: item)
        collectionView.reloadData()
    }
*/
    // MARK: UICollectionViewDelegate



    func itemsFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
          return  shoppingController.likedItems[indexPath.item]
        } else {
          return  shoppingController.notLikedItems[indexPath.item]
        }
    }

    func toggleHasBeenLiked(on cell: ItemCollectionViewCell) {
        guard let index = collectionView.indexPath(for: cell) else { return }
        let item = itemsFor(indexPath: index)
        shoppingController.toggleHasBeenLiked(shoppingItem: item)
        collectionView.reloadData()

    }


}
