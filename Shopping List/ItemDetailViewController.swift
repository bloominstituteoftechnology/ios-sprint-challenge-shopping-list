//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // shoppingItemController?.updateIsAdded(for: shoppingItem!)
        //shoppingItemController?.loadFromPersistentStore()
        updateViews()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setTheme() {
        guard let theme = listHelper!.themePreference else { return }
        
        if theme == "Added List" {
            shoppingItemController!.updateIsAdded(for: shoppingItem!)
        } else {
            shoppingItemController!.loadFoodFromAssets()
        }
        
    }

    
    var shoppingItemController: ShoppingItemController?
    var shoppingItem: ShoppingItem?
    var listHelper: ListHelper?
   
    // segue = "orderDetail"
    
    
    @IBOutlet weak var amountLabel: UILabel!
    
    
    @IBOutlet weak var personNameTextField: UITextField!
    
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {

        navigationController?.popViewController(animated: true)
        
    }
    
    func updateViews() {
       // guard
        
       // if let shoppingItem = shoppingItem {
       
        shoppingItemController?.loadFromPersistentStore()
        print(shoppingItemController?.shoppingList)
       // setTheme()
        amountLabel.text = "You currently have \(shoppingItemController?.shoppingList.filter({$0.isAdded}).count) item(s) in your shopping list."
           
        
            
          /*  let numberOfItems = shoppingItemController?.addedItems.count
            print(numberOfItems)
            let itemText: String = "You currently have \(numberOfItems) item(s) in your shopping list."
            amountTextView.text = itemText
            navigationItem.title = "Change Shopping List"*/
    


    }

}
