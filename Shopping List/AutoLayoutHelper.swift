//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

extension UIView
{
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left
        {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right
        {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom
        {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if width != 0
        {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0
        {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
