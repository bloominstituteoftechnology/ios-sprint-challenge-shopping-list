//
//  ShoppingListCollectionReusableView.swift
//  Shopping List
//
//  Created by Patrick Millet on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionReusableView: UICollectionReusableView {
        var label: UILabel = {
             let label: UILabel = UILabel()
             label.textColor = .white
             label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
             label.sizeToFit()
             return label
         }()

        override init(frame: CGRect) {
             super.init(frame: frame)

             addSubview(label)

             label.translatesAutoresizingMaskIntoConstraints = false
             label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
             label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
             label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
    }
    
    
}
