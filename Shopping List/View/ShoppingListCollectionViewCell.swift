//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
   
    
    @IBOutlet weak var hasAddedLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem?{
        
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        
        imageView.image = shoppingItem?.image
        nameLabel.text = shoppingItem?.name
        
        if shoppingItem?.hasAdded == true {
            hasAddedLabel.text = "Added"
        }else{
            hasAddedLabel.text = "Not Added"
        }
        
    }
    
//    let changeHasAdded = UserDefaults.standard.set(, forKey: <#T##String#>)
    
}
