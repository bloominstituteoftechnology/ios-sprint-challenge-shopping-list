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
    @IBOutlet weak var notAddedButton: UIButton!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func notAdded(_ sender: Any) {
        guard var item = item else { return }
        
        item.hasBeenAdded = !item.hasBeenAdded
        
        let buttonTapped = notAddedButton.currentTitle! == "Not Added" ?
        "Not Added" : "Added"
        notAddedButton.setTitle(buttonTapped, for: .normal)
    }
    
    
    private func updateViews() {
        guard let item = item else { return }
        
        imageView.image = item.image
        item.hasBeenAdded = !item.hasBeenAdded
        
        if item.hasBeenAdded == true {
            notAddedButton.setTitle("Not Added", for: [])
        } else {
            notAddedButton.setTitle("Added", for: [])
        }
        
    }
    
    
    
    
    
    
    
    
    
}
