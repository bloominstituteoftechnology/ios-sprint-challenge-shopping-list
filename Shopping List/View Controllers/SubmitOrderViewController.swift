//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by morse on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderSent(_ sender: Any) {
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
