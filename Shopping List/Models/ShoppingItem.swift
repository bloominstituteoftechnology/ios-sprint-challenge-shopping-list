//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasAddedItem: Bool
    var imageData: Data {
        guard let image = UIImage(named: name.lowercased()),
            let data = UIImagePNGRepresentation(image) else { return Data() }
        return data
    }
}
