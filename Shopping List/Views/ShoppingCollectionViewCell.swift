//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var beenAdded: UIButton!
    
    var hasBeenAdded: Bool = false
    
    func updateViews() {
        textLabel.text = shoppingItem.name
        imageView.image = shoppingItem.image
        
    }
    func activateButton(bool: Bool) {
        

        
        activateButton(bool: false)
    }
    var shoppingItem: Shopping {
        didSet {
            updateViews()
        }
    }
    @IBAction func beenAddedButton(_ sender: Any) {
        
        hasBeenAdded.toggle()
        
        if hasBeenAdded {
            beenAdded.setTitle("Added", for: .normal)
        } else {
            beenAdded.setTitle("Not Added", for: .normal)
        }
        
    }
    

}



