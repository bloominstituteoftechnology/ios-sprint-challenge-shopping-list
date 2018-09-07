//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let amount = shoppingItemController?.totalInCart() else { return }
        currentItemsLabel?.text = "You currently have \(amount) item(s) in your shopping list"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text
            else { return }
        
        localNotificationHelper?.getAuthorizationStatus { (status) in
            switch status {
            case .authorized:
                self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
            case .notDetermined:
                self.localNotificationHelper?.requestAuthorization(completion: { (granted) in
                    
                    if (granted) {
                        self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
                    }
                })
            default:
                return
            }
        }
    }
    
    

    @IBOutlet weak var currentItemsLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var localNotificationHelper: LocalNotificationHelper?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
