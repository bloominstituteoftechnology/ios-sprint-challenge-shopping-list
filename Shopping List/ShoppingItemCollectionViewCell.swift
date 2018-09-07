//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    func itemToggled(on cell: ShoppingItemCollectionViewCell)
}
class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        photoImageView?.image = UIImage(data: shoppingItem.imageData)
        itemLabel?.text = shoppingItem.item
        if shoppingItem.addedToList == true {
          addedLabel?.text = "Added"
        } else {
          addedLabel?.text = "Not Added"
        }
    
    }
    
    @IBAction func itemToggled(_ sender: Any) {
        delegate?.itemToggled(on: self)
    }

    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    
    
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
}
