//
//  DeliveryAddress.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct DeliveryAddress: Codable {
    var name: String
    var addressLineOne: String
    var addressLineTwo: String?
    var city: String
    var state: String
    var zipCode: String
}
