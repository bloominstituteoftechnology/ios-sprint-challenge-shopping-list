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
    
    var shoppingItem: Item?{
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBAction func isAddedButton(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
    }
    
    func updateView(){
        if let shoppingItem = shoppingItem{
            imageCell.image = UIImage(data: shoppingItem.image)
            nameButton.setTitle(shoppingItem.name, for: .normal)
            isAddedLabel.text = shoppingItem.isAdded ? "Added" : "Not Added"
        }
    }
}
