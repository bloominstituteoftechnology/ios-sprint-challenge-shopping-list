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
    messageLabel.text = "So far, you've picked out  \(selectedItems) items!"
}
    
}
