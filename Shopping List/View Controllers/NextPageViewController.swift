//
//  NextPageViewController.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class NextPageViewController: UIViewController {
    
    //MARK: -ViewWillAppear-
    
    override func viewWillAppear(_ animated: Bool) {
        itemStatement.text = "you added \(number) items(s)"
    }
    
    
    //MARK: -IBOutlets and IBActions-
    
    @IBOutlet var itemStatement: UILabel!
    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    
    //MARK: -important variables-
    
    var number = 0
    var userName = ""
    var userAddress = ""
    //MARK: -Alerts-
    
    private func showAlert() {
        
        if let name = name.text,
            let address = address.text {
            userName = name
            userAddress = address
        }
        
        let alert = UIAlertController(title: "delivery for \(userName)", message: "Your shopping items will be delivered to \(userAddress) in 15 minutes", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    
}//End of Class
