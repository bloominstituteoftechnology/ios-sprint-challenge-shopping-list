//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Ian French on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemAddLabel: UILabel!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    
    var shopController: ShoppingController?
    
    var shopList: ShopList? {
        didSet    { updateViews()}
    }
    
    
    private func updateViews() {
        guard let shopList = shopList  else
        { return }
        
        foodImageView.image = UIImage(named: shopList.item)
        itemLabel.text = shopList.item
        
        switch shopList.itemAdd {
        case true:
            itemAddLabel.text = "Added"
        default:
            itemAddLabel.text = "Not Added"
        }
    }
    
    
    
    
    
    
    
    
    
}
