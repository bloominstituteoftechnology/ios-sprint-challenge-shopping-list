//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    var item: ShoppingItem?
    {
        didSet
        {
            updateViews()
        }
    }
    
    func updateViews()
    {
        guard let item = item else {return}
        
        shoppingItemLabel.text = item.name
        shoppingItemImage.image = item.image
    }
    
}
