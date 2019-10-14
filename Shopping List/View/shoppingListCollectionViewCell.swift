//
//  shoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class shoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var addedItemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        addedItemLabel.text = "\(shoppingItem.addedItem ? "Added" : "Not Added")"
        imageTitle.text = shoppingItem.name
        imageView.image = UIImage(named: shoppingItem.name)
    }
    
}
