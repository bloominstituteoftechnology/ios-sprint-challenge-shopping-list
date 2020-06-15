//
//  EnterAddressViewController.swift
//  Shopping List
//
//  Created by Dojo on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class EnterAddressViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var numberOfItemsLabel: UILabel!
    @IBOutlet var enterNameTextField: UITextField!
    @IBOutlet var enterAddressTextField: UITextField!

    // MARK: - Properties
    var shoppingItemController: ShoppingItemController?


    // MARK: - IBActions
    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = enterNameTextField.text,
            !name.isEmpty,
            let address = enterAddressTextField.text,
            !address.isEmpty else { return }
        let alert = UIAlertController(title: "\(name)", message:
            """
            Your items will be deleivered to:
            \(address)
            in 25 minutes.
            """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        guard let numberOfItems = shoppingItemController?.shoppingListSelected.count else { return }
        numberOfItemsLabel.text = """
            You have \(numberOfItems) item(s) in your
            Cart.
            """

    }
}
