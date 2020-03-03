//
//  ImageCollectionViewCell.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
protocol ShoppingItemDelegate {
    func itemUpdated(shoppingItem: ShoppingItem)
}
class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addlLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var delegate: ShoppingItemDelegate?
    
    var item: ShoppingItem? {
          didSet {
              updateViews()
          }
      }

      private func updateViews() {
          guard let shoppingItem = item else { return }
        addlLabel.text = shoppingItem.didItemAdded ? "Added" : "Not Added"
        itemImage.image = shoppingItem.itemImage
          itemNameLabel.text = shoppingItem.name
      }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        item?.didItemAdded.toggle()
        if let shoppingItem = item {
            delegate?.itemUpdated(shoppingItem: shoppingItem)
        }

    }
    
}
