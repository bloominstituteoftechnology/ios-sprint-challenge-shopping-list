//
//  SkuCollectionViewCELL.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class SkuCollectionViewCELL: UICollectionViewCell {
    
    
    @IBAction func booleanButtonTapped(_ sender: Any) {
        
        delegate?.toggleSkuInCart(for: self)
    }
    
    func updateViews() {
        
        skuLabel.text = sku?.skuName
        skuLabel.textColor = .red
        
        imageView.image = UIImage(named: sku!.skuImageName)
        
        //if skuInCart is properly stored, this will unlock the previously stored value
        
        if sku?.skuInCart == true {
            booleanButtonLabel.titleLabel?.text = "Added"
            print("ADDED!!!!!")
        } else {
            booleanButtonLabel.titleLabel?.text = "not added"
            print("NOT")
        }
    }
    /*
     //UnNEEDED bc collectionView already sets these & they don't change
     //update sku's name & image
     //imageView.image = UIImage(named: sku.skuImageName)
     //skuLabel.text = sku.skuName
     
     if sku?.skuInCart == true {
     booleanButtonLabel.titleLabel?.text = "Added"
     
     } else {
     booleanButtonLabel.titleLabel?.text = "Not Added"
     
     }
     */
    
// PROPERTIES
    @IBOutlet weak var booleanButtonLabel: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var skuLabel: UILabel!
    
    var sku: Sku? {
        didSet {
            updateViews()
        }
    }
    var delegate: SkuCollectionViewCELLDelegate?
    
    var skuController = SkuController()
    
}
