//
//  ShopCell.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
  
  //MARK:- IBOutlets
  @IBOutlet private weak var itemStatus: UILabel!
  @IBOutlet private weak var itemImage: UIImageView!
  @IBOutlet private weak var itemName: UILabel!
  
  //MARK:- Properties
  
  var shoppingItem : ShoppingItem? {
    didSet {
      updateViews()
    }
  }
  
  //MARK:- Helper
  private func updateViews() {
    guard let shoppingItem = shoppingItem else { return }
    itemStatus.text = shoppingItem.hasAdded ? "Added" : "Not Added"
    itemStatus.textColor = shoppingItem.hasAdded ? UIColor.link : UIColor.red
    itemImage.image = shoppingItem.image
    itemName.text = shoppingItem.name
  }
}
