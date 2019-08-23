//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Joshua Sharp on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        imageView.image = UIImage(named: shoppingItem.name)
        label.text = shoppingItem.name
        uiSwitch.isOn = shoppingItem.selected
    }
    
}
