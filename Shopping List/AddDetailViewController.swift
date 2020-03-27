//
//  AddDetailViewController.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
func itemWasAdded(_ item: ShoppingItem)
}

class AddDetailViewController: UIViewController {

    @IBOutlet var foodText: UITextField!
    
    var delegate: AddItemDelegate?
    
    @IBAction func addFoodPressed(_ sender: Any) {
        guard let foodName = foodText.text else {return}
        
        if foodName == "" {
            let alert = UIAlertController(title: "Fill in the field!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "My bad", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
        } else {
        
            let newFood = ShoppingItem(name: foodName, added: false)
            delegate?.itemWasAdded(newFood)
        
            navigationController?.popViewController(animated: true)
        }
    }

}
