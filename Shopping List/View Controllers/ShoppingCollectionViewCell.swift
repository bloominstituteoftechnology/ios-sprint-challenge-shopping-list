//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Alexander Supe on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingCollectionViewCellDelegate {
    func toggleHasBeenAdded(for cell: ShoppingCollectionViewCell)
}

class ShoppingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var delegate: ShoppingCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    @IBAction func addedButton(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        if shoppingItem.added {
            addedLabel.text = "Added"
            addedLabel.isHidden = false
        } else {
            addedLabel.text = ""
            addedLabel.isHidden = true
        }
        nameLabel.text = shoppingItem.itemName
        button.setImage(UIImage(imageLiteralResourceName: shoppingItem.itemName), for: .normal)
        //Formatting
        addedLabel.layer.masksToBounds = true
        addedLabel.layer.cornerRadius = 10
        
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        nameLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
