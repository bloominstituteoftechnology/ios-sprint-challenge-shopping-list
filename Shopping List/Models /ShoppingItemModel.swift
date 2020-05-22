//
//  ShoppingItemModel.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable  {
    var name: String
    var added: Bool
    var imageData: Data
    var image = UIImage(data: imageData)
    
    init(name: String, imageName: String) {
    self.name = name
    self.added = true
    self.image = UIImage(named: imageName)!
    }
}


extension UIImage {
    var data: Data? {
        if let data = self {
            return data
        } else {
            return nil
        }
    }
}

extension Data {
    var image: UIImage? {
        if let image = UIImage(data: self) {
            return image
        } else {
            return nil
        }
    }
}
