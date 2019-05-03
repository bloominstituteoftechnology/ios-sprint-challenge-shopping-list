//
//  ItemCollectionViewCell.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    var delegate: ItemCollectionCellDelegate?

  
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenLiked(on: self)
    }

    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        itemLabel.text = shoppingItem.name
        imageView.image = UIImage(named: shoppingItem.name)

        
    }

    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    


    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    
}
