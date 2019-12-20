//
//  Alert.swift
//  Shopping List
//
//  Created by Kenny on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
class Alert {
    class func show(title: String, message: String, vc: UIViewController) { //class is similar to static
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}

