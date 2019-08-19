//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Vici Shaweddy on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var items: [ShoppingItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addedItems = self.items.filter { (item) -> Bool in
            return item.hasBeenAdded }
        
        if addedItems.isEmpty {
            titleLabel.text = "You currently don't have any item in your shopping list."
        } else if addedItems.count == 1 {
            titleLabel.text = "You currently have \(addedItems.count) item in your shopping list."
        } else {
            titleLabel.text = "You currently have \(addedItems.count) item(s) in your shopping list."
        }
        
    }
    

    
    @IBAction func submitButton(_ sender: Any) {
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
