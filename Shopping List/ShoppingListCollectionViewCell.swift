//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemNameLbl: UILabel!
    @IBOutlet var addedNotAddedLbl: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    var itemSelection: Shopping? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let shoppingSelection = itemSelection else {return}
        
        imageView.image = UIImage(named: shoppingSelection.imageName)
        addedNotAddedLbl.text = shoppingSelection.addedToList ? "Added" : "Not Added"
        itemNameLbl.text = shoppingSelection.itemName
    }
    
}
