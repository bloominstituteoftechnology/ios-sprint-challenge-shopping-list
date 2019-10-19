//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class OrderViewController: UIViewController {

    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    var addedCount: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func submitOrderButton(_ sender: Any) {
    }
    
    private func updateViews() {
        guard let itemCount = itemCount else { return }
        
        if addedCount == 1 {
            itemCount.text = "You've added (\(addedCount)) item to your order.  Please complete the information below to submit your order."
        } else {
            itemCount.text = "You've added (\(addedCount)) items to your order.  Please complete the information below to submit your order."
        }
    
    }


        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
