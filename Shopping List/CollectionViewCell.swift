//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var shoppingController: ShoppingController?
    var shoppingItem:ShoppingItem?
    
    
    
    func updateUI(){
        guard let item = self.shoppingItem else {return}
        if item.added {
            self.addedLabel.text = "Added"
        }
        else {
            self.addedLabel.text = "Not Added"
        }
        
        self.showimage.image = UIImage(data: item.image)
        self.itemName.text = item.name
        
    }

        weak var delegate: ShoppingCollectionCellDelegate?
 
    
    
    
    

    @IBOutlet weak var addedLabel: UILabel!
    
    
    
    @IBOutlet weak var showimage: UIImageView!
    
    
    @IBOutlet weak var itemName: UILabel!
    
    

    
}
