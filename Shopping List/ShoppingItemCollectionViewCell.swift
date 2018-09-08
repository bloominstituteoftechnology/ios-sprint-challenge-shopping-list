//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ItemCollectionCellDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var selectItem: UIButton!
    
    var item: ShoppingItem?{
        didSet {
            updateViews()
            
        }
    }
    
    @IBAction func itemPressed(_ sender: Any) {
//        item?.isSelected = !(item?.isSelected)!
        delegate?.hasBeenSelected(for: self)
    }
    
    private func updateViews (){
        guard let item = item else {return}
        
        imageView.image = UIImage(data: item.image)
        nameLabel.text = item.name
        
        if item.isSelected{
            selectItem.setTitle("✅", for: UIControlState.normal)
        } else if item.isSelected == false {
             selectItem.setTitle("❌", for: UIControlState.normal)
        }
    }
}
