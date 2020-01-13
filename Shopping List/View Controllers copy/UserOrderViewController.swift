//
//  UserOrderViewController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class UserOrderViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    //MARK: - IBOutlets
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userAddressText: UITextField!
    
    // MARK: - Properties
    
    var itemsAdded: [ShoppingItem]?
    
    var itemsInCart: Int? {
        return itemsAdded?.count
    }
    
    //MARK: - IBAction
    
    @IBAction func OrderButtonTapped(_ sender: UIButton) {
        guard let itemsInCart = itemsInCart,
            itemsInCart > 0,
            let userName = userNameText.text,
            let userAddress = userAddressText.text else { return }
        showAlert(userName: userName, userAddress: userAddress)
    }
    
    
    
    // MARK: - Methods
    
    private func showAlert(userName: String, userAddress: String) {
        let alert = UIAlertController(title: "Deilvery for \(userName) confirmed!", message: "Your order will be delivered to \(userAddress) in 15 minutes!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateViews() {
        guard let itemCount = itemsInCart else { return }
        
        itemsInCartLabel.text = "You have \(itemCount) item(s) added to your shopping list."
    }
}

