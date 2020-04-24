//
//  ShoppingItemViewController.swift
//  ShoppingList
//
//  Created by Jason on 4/24/20.
//  Copyright © 2020 Jason Thomas. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController{

    
    var item = "Apple"
    var itemAdded: Bool
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    init(itemAdded: Bool, itemNames: String) {
        self.itemAdded = itemAdded
        self.itemNames = [itemNames]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ShoppingItem () {
        var fileManager: String
      //  UserDefaults.standard.bool(forKey: .itemAdded)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
