//
//  ListCollectionViewController.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
var numberOfItems = 0
protocol ShoppingListDelegate: class {
    func shouldBeAdded()
}

class ListCollectionViewController: UICollectionViewController {
    
 
    let shoppingController = ShoppingController()
    
    var notAdded: Bool = true
    
    var delegate: ShoppingListDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell()}
    
        let item = shoppingController.items[indexPath.item]
        cell.itemImage.image = item.image
        cell.itemName.text = item.name
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // check to see if already added, then numberOfItems -= 1 (watch for less than 0 amount)
        numberOfItems += 1
       let userDefaults = UserDefaults.standard
       userDefaults.bool(forKey: .added)
       delegate?.shouldBeAdded()
      print("item at \(indexPath.item) tapped with \(numberOfItems) taps")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            guard let submitOrderVC = segue.destination as? ShoppingListeOrderViewController else { return }
            
        }
    }
    
    // MARK: UICollectionViewDelegate
    func shouldBeAdded() {
        self.collectionView?.reloadData()
    }
}

extension String {
    static var added = "notAdded"
}
