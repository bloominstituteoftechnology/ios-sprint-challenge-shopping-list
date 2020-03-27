//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Enrique Gongora on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    //MARK: - IBOutlets/Actions
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func sendOrderPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        let ac = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be deliverd to \(address) in 15 minutes", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Variables
    var shoppingListController = ShoppingListController()
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews(){
        label.text = "You currently have \(shoppingListController.addedToList.count) item(s) in your shopping list"
        
    }

}
