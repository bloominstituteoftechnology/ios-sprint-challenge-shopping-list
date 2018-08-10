//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCellDelegate: class {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell)
}

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShoppingListCellDelegate?
    
    var shoppingItem: Item?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBAction func isAddedButton(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
        
    }
    
    func updateView(){
        guard let imageCell = shoppingItem else {return}
        imageView.image = UIImage(data: imageCell.image)
        label.text = imageCell.name
        
        
    }
}
