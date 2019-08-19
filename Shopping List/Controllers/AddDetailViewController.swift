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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendItemsToNewView" {
            if let vc = segue.destination as? ShoppingListCollectionViewController {
                vc.delegate = self
            }
        }
    }
 
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
    }
    
}

extension AddDetailViewController: sendListToNextView {
    func listWasSent(_ list: [ShoppingItem]) {
        let count = list.count
        itemInfo.text = "You currently Have \(count) item(s) in your shopping list."
        
    }

    
}
