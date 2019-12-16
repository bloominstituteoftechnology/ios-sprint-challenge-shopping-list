//
//  ListCollectionViewController.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

protocol ShoppingListDelegate {
    func shouldBeAdded()
}

class ListCollectionViewController: UICollectionViewController {
    
 let shoppingController = ShoppingController()
    
    var notAdded: Bool = true
    
    var delegate: ShoppingListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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

    // MARK: UICollectionViewDelegate
    func shouldBeAdded() {
        self.collectionView?.reloadData()
    }
   
    @IBAction func addedButtonTapped(_ sender: Any) {
        notAdded = !notAdded
        
        let userDefaults = UserDefaults.standard
        userDefaults.bool(forKey: .notAdded)
        delegate?.shouldBeAdded()
    }
}
extension String {
    static var notAdded = "notAdded"
}
