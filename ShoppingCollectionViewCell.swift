//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_268 on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingCollectionViewCell: UICollectionViewCell {
    


    
    private let sectionInsets = UIEdgeInsets(top: 50.0,
    left: 20.0,
    bottom: 50.0,
    right: 20.0)

    
    let name: String
    var inList: Bool
    var image: UIImage
    
    init(name: String, inList: Bool, image: UIImage) {
        self.name = name
        self.inList = inList
        self.image = UIImage(named: name)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
