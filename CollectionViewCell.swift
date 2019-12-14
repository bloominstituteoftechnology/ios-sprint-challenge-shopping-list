//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - IBActions
    
    
    var delegate: CollectionViewCellDelegate?
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        func updateView() {
               guard let item = item else { return }
            nameLabel.text = item.itemName
               let image = UIImage(named: item.itemName)
               itemImageView.image = image
               if item.isAdded == false {
                   addedLabel.text = "Not Added"
               } else {
                   addedLabel.text = "Added"
               }
           }
        }

}
