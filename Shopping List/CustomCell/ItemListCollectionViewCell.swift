//
//  ItemListCollectionViewCell.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ItemListCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemAddedLabel: UILabel!
    
    weak var delegate: ItemListCollectionCellDelegate?
    var shoppingItem: ShoppingItem?
    {
        didSet
        {
            updateViews()
        }
    }
    
    func toggleLabelAndImage()
    {
        delegate?.toggleItemAdded(for: self)
    }
    
    func updateViews()
    {
        guard let shoppingItem = shoppingItem else {return}
        itemImageView.image = shoppingItem.imageIcon
        itemNameLabel.text = shoppingItem.itemName
        
        
        guard let checkedImage: UIImage = UIImage(named:"checked"),
            let uncheckedImage: UIImage = UIImage(named: "unchecked") else {return}
        
        if shoppingItem.itemAdded
        {
            checkboxImageView.image = checkedImage
            itemAddedLabel.text = "Added"
        }
        else
        {
            checkboxImageView.image = uncheckedImage
            itemAddedLabel.text = "Add to List"
        }
    }
}
