//
//  ButtonDelegate.swift
//  Shopping List
//
//  Created by Cameron Dunn on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
protocol ButtonDelegate : class{
    func tappedButton(on: CustomCollectionViewCell)
}
