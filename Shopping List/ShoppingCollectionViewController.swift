//
//  CollectionCollectionViewController.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController {
    
    var shoppingController = ShoppingController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let destination = segue.destination as? ViewController else {return}
        destination.shoppingController = shoppingController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView!.register(nib, forCellWithReuseIdentifier: "cell")
        
        collectionView!.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView!.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        layout.itemSize = CGSize(width: 150, height: 150)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = shoppingController.shoppingItems[indexPath.item]
        shoppingController.updateAddedToList(item: item)
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        guard let cell2 = cell as? CollectionViewCell else {return}
        cell2.updateUI()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView(collectionView, didDeselectItemAt: indexPath)
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!  CollectionViewCell
        cell.shoppingItem = shoppingController.shoppingItems[indexPath.item]
        cell.updateUI()
        
        return cell
    }
    
    
    
    
    
}

