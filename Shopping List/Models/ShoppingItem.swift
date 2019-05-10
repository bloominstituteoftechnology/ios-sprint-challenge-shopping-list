//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var image: String
    var isOnList: Bool
    
    init(name: String, imageName: String, isOnList: Bool) {
        self.name = name
        self.image = imageName
        self.isOnList = isOnList
    }
}

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
