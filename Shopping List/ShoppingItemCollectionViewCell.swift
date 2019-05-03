//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var selectedLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func cellButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenAdded(for: self)
        updateViews()
    }
    
    
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        nameLabel.text = shoppingItem.name
        switch shoppingItem.hasBeenAdded {
        case true: selectedLabel.text = "Added"
        case false: selectedLabel.text = "Not Added"
        }
        imageView.image = UIImage(named: shoppingItem.imageName)
        
    }
    
}
