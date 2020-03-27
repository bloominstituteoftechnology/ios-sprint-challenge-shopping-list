//
//  CreateShoppingOrderViewController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CreateShoppingOrderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemCount = shoppingController?.inShoppingList.count else { return }
        itemsInShoppingListLabel?.text = "You currently have \(itemCount) items(s) in your shopping list."
    }

    @IBAction func createOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        localNotificationHelper.requestAuthorization { (success) in
            self.localNotificationHelper.scheduleShoppingOrder(name: name, address: address)
        }
        navigationController?.popViewController(animated: true)
    }

    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var itemsInShoppingListLabel: UILabel!
    var shoppingController: ShoppingController?
    var localNotificationHelper: LocalNotificationHelper = LocalNotificationHelper()
}
