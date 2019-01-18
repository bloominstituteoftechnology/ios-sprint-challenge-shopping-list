//
//  CustomCollectionViewCell.swift
//  Shopping List
//
//  Created by Cameron Dunn on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    var item : ShoppingListItem?
    @IBAction func buttonTapped(_ sender: CustomCollectionViewCell) {
        delegate?.tappedButton(on: self)
    }
    weak var delegate : ButtonDelegate?
}
