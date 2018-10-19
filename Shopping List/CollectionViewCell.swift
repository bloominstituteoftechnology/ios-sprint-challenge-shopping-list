//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
      
        }
        
        
        
        @IBOutlet weak var AddItem: UILabel!
        
        
        var shoppingItem: shoppingItem! {
            didSet {
                updateViews()
            }
        }
        
        weak var delegate: ShoppingCollectionCellDelegate?
 
    
    
    
    
    
    
    
    @IBAction func added(_ sender: Any) {
        
        
        
    }
    
    
    @IBOutlet weak var showimage: UIImageView!
    
    
    @IBOutlet weak var itemName: UILabel!
    
    

    
}
