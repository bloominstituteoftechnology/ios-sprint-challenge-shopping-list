//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by patelpra on 6/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
   
    var shoppingItem: ShoppingItem? {
        didSet {
            self.updateViews()
        }
    }
    
    @IBOutlet var hasBeenAddedLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    @IBAction func shoppingItemTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenAdded(for: self)
    }
       
    private func updateViews() {
        guard  let shoppingItem = self.shoppingItem else { return }
        
        self.nameLabel.text = shoppingItem.name
        self.imageView.image = UIImage(named: shoppingItem.name)
        self.hasBeenAddedLabel.text = shoppingItem.hasBeenAdded ? "Added" : "Not Added"
    }
}
