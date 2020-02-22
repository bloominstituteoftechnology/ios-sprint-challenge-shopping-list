//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Claudia Contreras on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    //MARK: - Properties
    let shoppingController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    
    //MARK: - IBOutlet
    @IBAction func NextButtonTapped(_ sender: Any) {
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

    /*override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    } */


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingController.shoppingItems[indexPath.item]
        cell.item = item
        return cell
    }

}
