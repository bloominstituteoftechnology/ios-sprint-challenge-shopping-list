//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCollectionViewCellDelegate: AnyObject {
    func buttonWasPressed(on Cell: UICollectionViewCell)
}

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShoppingListCollectionViewCellDelegate?
    @IBOutlet weak var toggleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var buttonImage: UIButton!
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = shoppingItem else { return }
        
        
        imageView.image = UIImage(named: item.itemName)
        
        let text = item.hasBeenAdded ? "Added" : "Not Added"
        toggleLabel.text = text
        
       
        
//        let imageName = newItem.itemName
//        guard let image = UIImage(named: imageName) else { return }
//         buttonImage.setImage(image, for: .normal)
//        imageView.image = UIImage(named: newItem.itemName)
    }
    
    
    @IBAction func buttonTapped(_ sender: ShoppingListCollectionViewCell) {
        delegate?.buttonWasPressed(on: self)
        
    }
     
}
