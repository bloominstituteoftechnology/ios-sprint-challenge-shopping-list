//
//  AddHelper.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
class AddHelper {
    private let addPreferenceKey = "addPreference"
    func setPreferenceToAdd() {
        UserDefaults.standard.set(true, forKey: addPreferenceKey)
    }
    func setPreferenceToNotAdd() {
        UserDefaults.standard.set(false, forKey: addPreferenceKey)
    }
    var addPreference: Bool? {
        return UserDefaults.standard.bool(forKey: addPreferenceKey)
    }
    init() {
        guard addPreference == nil else {
            return
        }
        setPreferenceToNotAdd()
    }
}
