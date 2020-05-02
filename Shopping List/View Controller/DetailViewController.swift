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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var items: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfItems()
        self.navigationItem.backBarButtonItem?.title = "Change Shopping List"
    }

    func numberOfItems() {
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
    
    func showAlert() {
        guard let name = nameTextField.text,
            !name.isEmpty,
            let address = addressTextField.text,
            !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let name = nameTextField.text,
              !name.isEmpty,
              let address = addressTextField.text,
            !address.isEmpty else { return }

       self.showAlert()
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
