//
//  AddressViewController.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
   
    @IBOutlet weak var noticeLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
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
