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
    @IBAction func hasBeenAdded(_ sender: Any) {
    }
    
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        //set up label and image
        imageView.image = UIImage(named: shoppingItem.name)
        imageTitle.text = shoppingItem.name
    }
    
}
