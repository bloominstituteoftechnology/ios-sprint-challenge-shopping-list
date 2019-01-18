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
        updateViews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var shoppingItemController: ShoppingItemController?
    var shoppingItem: ShoppingItem?
    
    // segue = "orderDetail"
    
    @IBOutlet weak var amountTextView: UITextView!
    
    
    @IBOutlet weak var personNameTextField: UITextField!
    
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        //  guard let bookTitle = titleTextField.text else { return }
        
        if let shoppingItem = shoppingItem {
            let numberOfItems = shoppingItemController?.addedItems.count
            let itemText: String = "You currently have \(numberOfItems ?? 0) item(s) in your shopping list."
            amountTextView.text = itemText
            navigationItem.title = "Change Shopping List"
        
    }
    
    
    


    }

}
