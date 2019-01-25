//
//  DeliveryViewController.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController {

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
    
    //Mark: - Outlets
    @IBOutlet weak var listContainsLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        
        
    }
    

}
