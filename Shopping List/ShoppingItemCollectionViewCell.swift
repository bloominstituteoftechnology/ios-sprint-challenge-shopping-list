//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDegelate: class {
    func tappedLikeButton(on cell: UICollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {



    @IBAction func like(_ sender: Any) {
        delegate?.tappedLikeButton(on: self)
    }

    func updateViews() {
        guard let item = item else { return }

        imageView.image = UIImage(named: item.name)

        if item.isLiked == true {
            likeButton.setTitle("Unlike", for: .normal)
        } else {
            likeButton.setTitle("Like", for: .normal)
        }
    }

    // IBOutlets & Properties

    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }


    weak var delegate: ShoppingItemCollectionViewCellDegelate?
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var itemLabel: UILabel!

    

   


}
