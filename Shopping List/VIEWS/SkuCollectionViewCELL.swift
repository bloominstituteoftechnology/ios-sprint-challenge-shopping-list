//
//  SkuCollectionViewCELL.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class SkuCollectionViewCELL: UICollectionViewCell {
    
    
    //MARK: PROPERTIES
    @IBOutlet var booleanButtonLabel: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var skuLabel: UILabel!
    
    var skuController = SkuController()
    var sku: Sku? {
        didSet {
            updateViews()
        }
    }
    var delegate: SkuCollectionViewCELLDelegate?
    
    
    //MARK: METHODS
    
    
    @IBAction func booleanButtonTapped(_ sender: Any) {
    
        delegate?.toggleSkuInCart(for: self)
    }
    
    
    func updateViews() {
        
        guard let sku = sku else {return}
        skuLabel.text = sku.skuName
        imageView.image = UIImage(named: "\(sku.skuImageName.capitalized)")
        
        // set the change in button title and titleColor for user selection
        if sku.skuInCart == true {
            //NOTE: .text is for TEXTFIELDS not LABLES .titleLabel?.text = "Added"
            booleanButtonLabel.setTitleColor(.green, for: .normal)
            booleanButtonLabel.setTitle("ADDED!", for: .normal)
        } else {
            //NOTE! setTitleColor is used, not textColor
            booleanButtonLabel.setTitleColor(.white, for: .normal)
            booleanButtonLabel.setTitle("not added", for: .normal)
        }
    }
    
    
}
