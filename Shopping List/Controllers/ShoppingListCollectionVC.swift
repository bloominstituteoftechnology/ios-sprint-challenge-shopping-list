//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Jeffrey Santana on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionVC: UICollectionViewController {
	
	let shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
	
	//MARK: - Methods
	
	private func loadItems() {
		
	}

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UICollectionViewCell() }
		let item = shoppingListController.list[indexPath.item]
		
		cell.item = item
    
        return cell
    }
	
	

}
