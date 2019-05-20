//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Cameron Dunn on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CheckoutViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var model : ShoppingListModel?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.addedItemsList.count
    }
    @IBAction func checkout(_ sender: Any) {
        if(nameTextField.text != "" && addressTextField.text != "" && (model?.addedItemsList.count)! > 0){
            let name = nameTextField.text
            let address = addressTextField.text
            let alert = UIAlertController(title: "Checkout?", message: "Are you sure you would like to checkout, you currently have \(model?.addedItemsList.count ?? 0) items in your cart under the name: \(name ?? "") and your address is currently set to: \(address ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in
                let alert = UIAlertController(title: "Checkout Successful", message: "You have successfully checked out.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert, animated: true)
        }else if(model?.addedItemsList.count == 0){
            let alert = UIAlertController(title: "Error", message: "You must have more than one item added in order to check out", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert,animated: true)
        }else{
            let alert = UIAlertController(title: "Error", message: "You cannot leave the information fields blank", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if((model?.addedItemsList.count)! > 1){
            label.text = "You currently have \(model!.addedItemsList.count ) items in your shopping list."
        }else if(model?.addedItemsList.count == 1){
            label.text = "You currently have one item in your shopping list."
        }else{
            label.text = "You do not currently have anything in your shopping list."
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.itemImage.image = UIImage(data: model!.addedItemsList[indexPath.row].image!)
        cell.label.text = model!.addedItemsList[indexPath.row].nameOfItem
        return cell
    }
    
    
}
