//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {didSet {updateViews()}}
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        
        imageView.image = UIImage(named: shoppingItem.name)
        textLabel.text = shoppingItem.name
    }
    
    
}
