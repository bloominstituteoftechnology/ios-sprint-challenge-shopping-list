//
//  DetailViewController.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }

    func updateViews() {
        guard isViewLoaded else { return }
        guard let shoppingList = shoppingController?.likedItems else { return }

        likeItemsLabel.text = "You currently have \(shoppingList.count) in your shopping List."
    }
    


    @IBOutlet weak var likeItemsLabel: UILabel!
    var shoppingController: ShoppingController?

}
