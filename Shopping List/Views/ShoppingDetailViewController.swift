//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    var shoppingController: ShoppingController? = nil

    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        
        //TODO: Implement Notification on tap
        
    }
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    func updateViews(){
        guard let shoppingController = shoppingController else { return }
        textView.text = "You currently have \(shoppingController.itemsAdded) item(s) in your shopping list."
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
