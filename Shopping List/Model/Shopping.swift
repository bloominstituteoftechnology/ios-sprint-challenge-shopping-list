//
//  Shopping.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Shopping: Equatable, Codable {
    
    var name: String
    var beenAdded: Bool = false
    
    init(name: String, beenAdded: Bool = false) {
        self.name = name
        self.beenAdded = beenAdded
    }
    
}
