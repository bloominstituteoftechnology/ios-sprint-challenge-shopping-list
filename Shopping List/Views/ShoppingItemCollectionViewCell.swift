//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jesse Ruiz on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol NumberOfItemsDelegate {
    func addItems(items: Int)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    // MARK: - Properties
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    var delegate: NumberOfItemsDelegate?
    
    // MARK: - Methods
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        itemImage.image = shoppingItem.image
        itemLabel.text = shoppingItem.name
    }
    
    // MARK: - Actions
    @IBAction func itemAddNotAdd(_ sender: UIButton) {
        let button = sender
        if shoppingItem?.hasBeenAdded == false {
            button.setTitle("Added", for: .normal)
            shoppingItem?.hasBeenAdded = true
        } else {
            button.setTitle("Not Added", for: .normal)
            shoppingItem?.hasBeenAdded = false
        }
//        let userDefaults = UserDefaults.standard
//        button = userDefaults.bool(forKey: "<#T##String#>")
        
        var addCount = 0
        if shoppingItem?.hasBeenAdded == true {
            addCount += 1
        }
        delegate?.addItems(items: addCount)
    }
}
