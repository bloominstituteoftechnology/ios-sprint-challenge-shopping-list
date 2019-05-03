//
//  ItemCollectionViewController.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewController: UICollectionViewController {
    let sC = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
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
        return sC.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemsCollectionViewCell
        let itemToPass = sC.shoppingItems[indexPath.item]
        cell.shoppingItem = itemToPass
        cell.delegate = self
        return cell
    }

}

extension ItemCollectionViewController: ItemsCollectionViewCellDelegate {
    func buttonImageWasPressed(on Cell: UICollectionViewCell) {
        //grab the item in the cell via index
        guard let index = collectionView?.indexPath(for: Cell) else { return }
        
        //now that we have the index we can subscript the array
        let item = sC.shoppingItems[index.item]
        
        //now that we have the item we can toggle it's boolean property
        sC.toggleHasBeenChanged(shoppingItem: item)
        
        //now that we have toggled the item we can reload the collection view
        collectionView?.reloadItems(at: [index])
        
    }
    
    
}
