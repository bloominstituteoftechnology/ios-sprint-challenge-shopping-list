//
//  EditShoppingListViewController.swift
//  Shopping List
//
//  Created by LaFleur on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol EditShoppingListDelegate: class {
      
  }

class EditShoppingListViewController: UIViewController {

     
        weak var delegate: EditShoppingListDelegate?
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            self.updateViews()
        }

        
        private func updateViews() {

        }

    extension String {
        // Class property, not instance - accessible across entire app/project
       static var shouldBeAddedKey = "ShouldBeAdded"
    }
}
