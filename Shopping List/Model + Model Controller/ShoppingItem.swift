//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable{
    
    
    let name: String
    let imageName: String
    var isInList: Bool = false
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(name: String, isInList: Bool = false){
        
        
        self.name = name
        self.isInList = isInList
        self.imageName = name
    }
    
    
    
    
}
