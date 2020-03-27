//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var yourShoppingListLabel: UILabel!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        updateViews()
        super.viewDidLoad()
        
  

        // Do any additional setup after loading the view.
    }
    
    func updateViews(){
        
        guard let items = shoppingListController?.addedItems else {return}
        
            yourShoppingListLabel.text = "You currently have" + " \(String(describing: items.count))" + " item(s) in your shopping list."
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        showAlert()
    }
    
    func showAlert(){
        
        guard let name = nameTextField.text, !name.isEmpty else {return}
        guard let address = addressTextField.text, !address.isEmpty else {return}
        let alert = UIAlertController(title: "Order for \(name)", message: "Your order will be delivered to \(address) in 15 minutes", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
