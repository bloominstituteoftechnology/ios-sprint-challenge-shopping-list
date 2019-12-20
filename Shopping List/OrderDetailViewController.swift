//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Ufuk Türközü on 20.12.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    let shoppingListController = ShoppingListController()
    
    var shoppingItem: ShoppingItem?
    
    var shoppingItems: [ShoppingItem] = []

    @IBOutlet weak var orderTextLabel: UILabel!
    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAddressTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
        
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(String(describing: enterNameTF.text))"
        content.subtitle = "Your shopping items will be delivered to \(String(describing: enterAddressTF.text))"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Send Order", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        

    }
    
    func updateViews() {
        orderTextLabel.text = "You currently have \(shoppingListController.selectedItems.count) Item(s) in your shopping list."
        
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
