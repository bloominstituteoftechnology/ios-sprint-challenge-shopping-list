//
//  UserDetailedViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {

    @IBAction func submitOrderButtonTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Order Recieved", message: "Will be Delivered in 15 minutes ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Thank You", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
