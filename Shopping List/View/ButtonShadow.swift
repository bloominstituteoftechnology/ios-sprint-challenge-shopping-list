//
//  ButtonShadow.swift
//  Shopping List
//
//  Created by Fabiola S on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ButtonShadow: UIButton {
    
    override func awakeFromNib() {
        
        layer.shadowPath = CGPath(rect: layer.bounds, transform:  nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3.0
        
        layer.cornerRadius = 5.0
    }
}
