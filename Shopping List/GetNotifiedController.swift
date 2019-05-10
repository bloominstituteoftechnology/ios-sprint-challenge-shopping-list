//
//  GetNotifiedController.swift
//  Shopping List
//
//  Created by Lotanna Igwe-Odunze on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class GetNotifiedController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeMessage()
        
    }
    
    //Change the message to match the items selected
    
    var itemController: ItemController?
    
    func changeMessage(){
    guard let itemController = itemController else { return }
    let selectedItems = itemController.selections.count
    messageLabel.text = "So far, you've picked out \(selectedItems) items!"
    } // End of function
    
    //Get Notified Button
    @IBAction func notifyMe(_ sender: UIButton) {
    
    //Don't do anything if there's nothing in the name and address fields
    guard let name = nameField.text,
    let address = addressField.text else {return}
    
    //Don't do anything if either the fields are empty or there are no selected items
    let selectedItems = itemController?.selections.count
    if selectedItems == 0 || name.isEmpty || address.isEmpty {return}
    
    //Ask permission to be notified
    Notifier().requestAuthorisation { (authorizationStatus) in
    if authorizationStatus == true{
    Notifier().notify()
    } else {
    return
    }
    }
    
    //Clear fields and selections after being notified
    nameField.text = ""
    addressField.text = ""
    itemController?.dropItems()
        
    //Save to persistence
    itemController?.saveShoppingFile()
    navigationController?.popViewController(animated: true)
        
    } //End of Get Notified Button

}//End of class
