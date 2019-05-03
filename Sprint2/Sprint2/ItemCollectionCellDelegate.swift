//
//  ItemCollectionCellDelegate.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation


protocol ItemCollectionCellDelegate {
    func toggleHasBeenLiked(on cell: ItemCollectionViewCell)
}
