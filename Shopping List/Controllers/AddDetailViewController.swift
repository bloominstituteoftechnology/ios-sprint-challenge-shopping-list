//
//  AddDetailViewController.swift
//  Shopping List
//
//  Created by Aaron on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var sentToName: UITextField!
    @IBOutlet weak var itemInfo: UILabel!
    @IBOutlet weak var sendToAddress: UITextField!
    
    var delegate: sendListToNextView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation


 
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
    }
    
}


