//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let item = shoppingItem else { return }
        imageView.image = UIImage(data: item.imageData)
    }
}
