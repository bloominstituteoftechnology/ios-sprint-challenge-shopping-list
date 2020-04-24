//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Rebecca Overare on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
class Item: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(item, forKey: "item")
        coder.encode(itemAdded, forKey: "itemAdded")
        coder.encode(image, forKey: "image")
    }
    
    required init?(coder decoder: NSCoder) {
        super.init()
        
        if let archivedItem = decoder.decodeObject(forKey: "item") as? String {
            item = archivedItem
        }
    }
    
    
    var item: String
    var itemAdded: Bool
    var image: UIImage
    
    init(item: String, itemAdded: Bool, imageName: String) {
         
         self.item = item
         self.itemAdded = itemAdded
         self.image = UIImage(named: imageName)!
     }

 
}


