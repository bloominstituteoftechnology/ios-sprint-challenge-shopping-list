//
//  Shopping.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Shopping {
    
    var name: String
    var image: UIImage
    var beenAdded: Bool
    
    init(name: String, imageName: String, beenAdded: Bool) {
        self.name = name
        self.image = UIImage(named: imageName)!
        self.beenAdded = false
    }
}
