//
//  ListCollectionViewCell.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemAdded: UILabel!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingList: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let list = shoppingList else { return }
        imageView.image = list.image
        itemName.text = list.item
        itemAdded.text = (list.added ? "Added" : "Not Added")
    }
}
