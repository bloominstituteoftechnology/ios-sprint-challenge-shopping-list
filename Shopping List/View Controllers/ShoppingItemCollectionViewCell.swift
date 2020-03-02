//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItemController: ShoppingItemController?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var addOrRemoveButton: UIButton!
    
    // MARK: IBActions
    @IBAction func addOrRemove(_ sender: Any?) {
        
        
        
    }
    
    func updateViews() {
        shoppingItemImage.image = shoppingItem?.image
        shoppingItemLabel.text = shoppingItem?.name
        guard let item = shoppingItem else { return }
        let buttonTitle = item.itemSelected ? "Remove" : "Add"
        addOrRemoveButton.setTitle(buttonTitle, for: .normal)
    }
    
}


