//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 15/11/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let itemsAdded = ItemCollectionViewCell()
    
    @IBOutlet weak var detailViewLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailViewLabel.text = "You currently have items in your shopping list"
    }
    
    @IBAction func sendOrderPressed(_ sender: Any) {
    }
    
    func addToDetailLabel() {
        
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
