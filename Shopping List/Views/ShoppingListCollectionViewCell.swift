//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ItemCollectionViewDelegate?

    @IBOutlet weak var didAddButtonLabel: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    
    @IBAction func didAddButtonAction(_ sender: Any) {
        delegate?.wasAddedTapped(onCell: self)
    }
    
    var items: ShoppingItem? {
           didSet {
               updateViews()
           }
       }
       
       private func updateViews() {
           guard let item = self.items else { return }
           
//        didAddButtonLabel.text = item.didSelectItemAt
           
           // This allows me to which off and on the button.
        let wasAdded = item.didSelectItemAt ? "Seen" : "Not Seen"
           didAddButtonLabel.setTitle(wasAdded, for: [])
       
       }
    
}
