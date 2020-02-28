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
        
        imageView.image = item.image
        label.text = item.name
        
    }

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
}
