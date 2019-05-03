//
//  CartViewController.swift
//  Shopping List
//
//  Created by Christopher Aronson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    var numberOfItemsInCart: Int?

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let numberOfItems = numberOfItemsInCart else { return }
        
        if numberOfItems == 1 {
            itemsInCartLabel.text = "You currently have \(numberOfItems) item in your cart"
        } else {
            itemsInCartLabel.text = "You currently have \(numberOfItems) items in your cart"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addToCartButtonTapped(_ sender: Any) {
    }
}
