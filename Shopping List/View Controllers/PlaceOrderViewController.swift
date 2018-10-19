//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Jerrick Warren on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var placeOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // should I add a notification Helper file?
        
        
    }
    

    
    @IBAction func placeOrderButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty else
        {return}
    }
    
    
    private func updateViews() {
        
        guard let shoppingItemController = shoppingItemController else { return }
        let numberOfItems = shoppingItemController.itemsOnList.count
        placeOrderLabel.text = "Enter your name and address for your \(numberOfItems) item\(numberOfItems == 1 ? "" : "s")."
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


