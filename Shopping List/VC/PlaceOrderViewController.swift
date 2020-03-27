//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    var notify =  Notify()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func updateView(){
        guard let shoppingItemController = shoppingItemController else {return}
        let index = shoppingItemController.shoppingItems.count
        
        titleLabel.text = "You currently have \(index) item(s) in your shopping list."
    }
    @IBAction func placeOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            name != " ",
            address != " " else {return}
        shoppingItemController?.saveToPresistent()
        navigationController?.popViewController(animated: true)
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
