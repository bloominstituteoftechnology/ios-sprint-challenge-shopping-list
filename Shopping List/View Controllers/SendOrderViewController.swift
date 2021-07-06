//
//  SendOrderListController.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var orderTitle: UILabel!
    @IBOutlet var orderName: UITextField!
    @IBOutlet var orderAddress: UITextField!
    
    var shoppingListController = ShoppingListController()
    var addedItem: ShoppingItem?
    
    func showAlert() {
        let alert = UIAlertController(title: "Your Order Has Been Entered", message: "\(String(describing: orderName.text!)), your order will be shipped to  \(String(describing: orderAddress.text!))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        orderTitle.text = "You have \(shoppingListController.addedItems.count) item(s)"
    }
    
    //MARK: IBActions
    @IBAction func enterOrder(_ sender: UIButton) {
        showAlert()
    }
    
}
