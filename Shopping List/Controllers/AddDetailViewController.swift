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
    
    // MARK - Send Note when View Disappears.
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
     
    }
    
    var delegate: [ShoppingItem]?{
        didSet {
            
        }
    }
    
    func updateValues() {
        guard let count = delegate?.count else {return}
        self.itemInfo.text = "You Have \(count) item(s) in your shopping list."
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        
    }
    
}


