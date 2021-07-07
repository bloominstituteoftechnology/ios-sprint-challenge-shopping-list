//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var shoppingItemController: ShoppingItemController? 
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
}
