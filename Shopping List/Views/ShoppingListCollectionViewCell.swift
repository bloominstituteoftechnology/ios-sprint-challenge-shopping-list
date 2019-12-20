//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedItem: UILabel!
    
    var shoppingItem: ShoppingItem?
    {
        didSet
        {
            updateViews()
        }
    }
    
    func updateViews()
    {
        guard let shoppingItem = shoppingItem else {return}
        imageView.image = shoppingItem.itemImage
        itemName.text = shoppingItem.name
    }
}
