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
        
        guard let sku = sku else {return}
        
            skuLabel.text = sku.skuName
            print("we got to the image load statement which clearly isn't working")
            imageView.image = UIImage(named: "apple" /*sku.skuImageName*/)
        
        
        if sku.skuInCart == true {
            booleanButtonLabel.setTitle("Added", for: .normal)                  // .text is for TEXTFIELDS not LABLES .titleLabel?.text = "Added"
            print("ADDED!!!!!")
        } else {
            booleanButtonLabel.setTitle("not added", for: .normal)                                                  //.titleLabel?.text = "not added"
            print("NOT") }
       
    }
    
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
