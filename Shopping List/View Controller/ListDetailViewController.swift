//
//  ListDetailViewController.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    var sc: ShoppingController?

    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
        alert()
    }
    
    func alert(){
        
    }
    
    func updateLabel(){
        guard let number = sc?.hasBeenAddedArray.count else {return }
        let text = number > 1 ? "You currently have \(number) items in your shopping cart" : "You currently have \(number) item in your shopping cart"
        shoppingLabel.text = text
    }
}
