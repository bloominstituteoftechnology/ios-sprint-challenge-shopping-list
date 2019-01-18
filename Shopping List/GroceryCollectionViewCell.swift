//
//  GroceryCollectionViewCell.swift
//  Shopping List
//
//  Created by Nathanael Youngren on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol GroceryCollectionViewCellDelegate: class {
    func toggleAdded(for cell: GroceryCollectionViewCell)
}

class GroceryCollectionViewCell: UICollectionViewCell {
    
    @IBAction func addedButtonTapped(_ sender: UIButton) {
        delegate?.toggleAdded(for: self)
    }
    
    private func updateViews() {
        if let item = item {
            itemLabel.text = item.name
            itemImage.image = item.image
            
            let key = UserDefaults.standard.bool(forKey: .isAddedToCartKey)

            if key == true {
                isAddedLabel.titleLabel?.text = "Added"
            } else if key == false {
                isAddedLabel.titleLabel?.text = "Not Added"
            }
        }
    }
    
    @IBOutlet weak var isAddedLabel: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    var item: ShoppingItem? {
        didSet{ updateViews() }
    }
    
    weak var delegate: GroceryCollectionViewCellDelegate?
    
}
