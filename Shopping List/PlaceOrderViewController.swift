//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class PlaceOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }

    func presentOrderPlaced() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in }

        let content = UNMutableNotificationContent()
        content.title = "Order placed for \(nameTextField!.text ?? "Your home address")"
        content.body = "Your order for \(orderTotal) item('s) will be delievered to \(addressLabel!.text ?? "your home address") in 15 minutes."

        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        center.add(request) { (error) in
        }

       // let alert = UIAlertController(title: "Order placed for \(nameTextField!.text ?? "something")", message: "Your order for \(orderTotal) item('s) will be delievered to \(addressLabel!.text ?? "your home address").", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        //present(alert, animated: true, completion: nil)
    }
    func updateViews() {
        orderLabel.text = "You have \(orderTotal) item('s) in your shopping List"
    }
    //Mark: - Properties
    var orderTotal: Int = 0
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBAction func placeOrderButtonPressed(_ sender: Any) {
        presentOrderPlaced()
    }

}

