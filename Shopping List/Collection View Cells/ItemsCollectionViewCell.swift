//
//  ItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ItemsCollectionViewCellDelegate: AnyObject {
    func buttonImageWasPressed(on Cell: UICollectionViewCell)
}

class ItemsCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ItemsCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonImage: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func buttonImagePressed(_ sender: UIButton) {
        delegate?.buttonImageWasPressed(on: self)
    }
    
    func updateViews(){
        guard let passedInItem = shoppingItem else { return }
        let labelText = passedInItem.hasBeenAdded ? "Added" : "Not Added"
        label.text = labelText
        nameLabel.text = passedInItem.name
        
        //this is where we create the images
        let imageName = passedInItem.imageName
        guard let image = UIImage(named: imageName) else { return }
        buttonImage.setImage(image, for: .normal)
    }
}
