//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        var artAssets = [String] ()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contents(atPath: path)
        
        
        for item in items! {
            
            if item.hasPrefix("imageset") {
                artAssets.append(item)
                }
            
            print(artAssets)
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

