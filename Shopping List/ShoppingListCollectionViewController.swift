//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class ShoppingListCollectionViewController: UICollectionViewController, ShoppingItemCollectionViewCellDelegate  {
    
    var delegate: ShoppingItemCollectionViewCellDelegate?
    
    var shoppinglistController = ShoppingItemController()
    
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else {return}
        let item = shoppinglistController.shoppingItems[indexPath.item]
            shoppinglistController.updateHasBeenAdded(for: item)
        collectionView?.reloadItems(at: [indexPath])
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppinglistController.shoppingItems.count
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell() }
    
        // Configure the cell
        let shoppingitem = shoppinglistController.shoppingItems[indexPath.item]
        cell.delegate = self
        cell.ShoppingItem = shoppingitem
        
    
        return cell
    }
    
    
    // passing hasbeenadded.count to detail view controller

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "showDetailSegue" {
                   guard let destinationVC = segue.destination as? SendOrderDetailViewController else { return }

                destinationVC.shoppinglistController = self.shoppinglistController
    }
}
 
}
