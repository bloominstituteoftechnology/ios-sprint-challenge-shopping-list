//
//  ShoppingListSectionHeaderView.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListSectionHeaderView: UICollectionReusableView {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Properties
    
    var title: String? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Private
    
    private func updateViews() {
        titleLabel.text = title
    }
}
