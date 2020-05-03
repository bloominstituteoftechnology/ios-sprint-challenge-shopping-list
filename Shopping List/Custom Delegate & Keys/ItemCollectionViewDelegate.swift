//
//  ItemCollectionViewDelegate.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

protocol ItemCollectionViewDelegate: class {
    func wasAddedTapped(onCell cell: ShoppingListCollectionViewCell)
}
