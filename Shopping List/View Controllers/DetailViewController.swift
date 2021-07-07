//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let groceryItemController = GroceryItemController ()
    
    @IBOutlet weak var itemCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemCountLabel.text = "You have \(groceryItemController.addedListCount) item(s) in your cart."
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
