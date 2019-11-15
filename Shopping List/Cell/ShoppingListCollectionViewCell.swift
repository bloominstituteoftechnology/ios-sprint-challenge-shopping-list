//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    
    
    
    
    
    
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else { return }
        
    }
    
}
