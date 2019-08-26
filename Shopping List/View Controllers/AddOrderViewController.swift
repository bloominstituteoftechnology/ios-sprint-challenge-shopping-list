//
//  AddOrderViewController.swift
//  Shopping List
//
//  Created by Austin Potts on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {

    
    @IBOutlet weak var cartItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
    }
    
    var item: ShoppingItem?
    var listController: ListController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }

    
    
    
    func setViews(){
        
        let userDefaults = UserDefaults.standard.bool(forKey: .changeHasBeenAdded)
        
        guard let itemController = item else {return}
        var itemCount = 0
        for item in itemController.name {
            if userDefaults == true {
                itemCount += 1
            }
     }
        cartItemsLabel.text = "You currentl have \(itemCount) item(s) in your cart"
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
