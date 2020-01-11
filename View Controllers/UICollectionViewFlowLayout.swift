//
//  UICollectionViewFlowLayout.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
protocol UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
}

class UICollectionViewFlowLayout: UICollectionViewLayout {
    
    var scrollDirection: UICollectionView.scrollDirection
    var mimimumLineSpacing: CGFloat
    var itemSize: CGSize
    var estimatedItemSize: CGSize
    var sectionInset: UIEdgeInsets
    var sectionInsetReference
}
