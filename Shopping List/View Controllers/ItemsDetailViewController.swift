//
//  ItemsDetailViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsDetailViewController: UIViewController {

    var item: ShoppingItem?
    var shoppingContoller: ShoppingListController?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    @IBAction func sendOrder(_ sender: Any) {
        alert()
        }
        
        
    func updateViews() {
        if let shoppingController = shoppingContoller {
            let items = shoppingController.shoppingItems.filter( {$0.hasBeenAdded == true })
        }
    }
    
    
    // Shopping List Notifications
    
    func alert() {
        if let name = nameLabel.text,
            let address = addressLabel.text {
            let alert = UIAlertController(title: "Heya \(name)!", message: "Your items will be delivered in 15 mintues to \(address).", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
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
