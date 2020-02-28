//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
          didSet {
              updateViews()
          }
      }
      
    
    
    private func updateViews() {
        guard let item = item else { return }
        
        
        
    }

    
    
    
    
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var label: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
}
