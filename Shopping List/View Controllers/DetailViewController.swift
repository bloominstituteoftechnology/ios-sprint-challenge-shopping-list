//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var countOfPickedItems: Int = 0
    
    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.navigationController?.navigationBar.topItem?.title = "Change Shopping List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        orderSummaryLabel.sizeToFit()
        orderSummaryLabel.text = "You currently have \(countOfPickedItems) item(s) in your shopping list."
    }
    
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
  //      super.navigationController?.navigationBar.topItem?.title = "Shopping List"
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
