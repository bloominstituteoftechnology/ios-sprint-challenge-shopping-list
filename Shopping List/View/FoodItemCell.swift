//
//  FoodItemCell.swift
//  Shopping List
//
//  Created by Kenny on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FoodItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addedLbl: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else {return} //in order to unwrap for setting image even though this is redundant given the didSet pattern
        self.imageView.image = UIImage(named: item.name)
        self.nameLbl.text = item.name
        if item.hasBeenAdded {
            self.addedLbl.text = "Added"
        } else {
            self.addedLbl.text = "Not Added"
        }
    }
}
