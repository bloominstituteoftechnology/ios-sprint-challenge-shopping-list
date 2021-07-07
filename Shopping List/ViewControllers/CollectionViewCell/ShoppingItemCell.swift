//
//  ShoppingItemCell.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCell: UICollectionViewCell
{
    //MARK: - UI Objects
    
    let shoppingItemImageView: UIImageView =
    {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let shoppingItemNameLabel: UILabel =
    {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.sizeToFit()
        
        return label
    }()
    
    let didSelectImageView: UIImageView =
    {
        let iv = UIImageView(image: #imageLiteral(resourceName: "checked").withRenderingMode(.alwaysTemplate))
        iv.tintColor = .green
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = true
        
        return iv
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupUI()
    }
    
    //MARK: - AutoLayout constraints
    
    fileprivate func setupUI()
    {
        addSubview(shoppingItemImageView)
        addSubview(shoppingItemNameLabel)
        addSubview(didSelectImageView)
        
        shoppingItemImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: self.frame.height - 24)
        
        shoppingItemNameLabel.anchor(top: shoppingItemImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: -4, width: 0, height: 0)
        
        didSelectImageView.anchor(top: nil, left: nil, bottom: shoppingItemImageView.bottomAnchor, right: shoppingItemImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 6, paddingBottom: -6, width: 40, height: 40)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
























