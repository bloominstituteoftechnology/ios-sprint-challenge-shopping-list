//
//  ListHelper.swift
//  Shopping List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ListHelper {
    
    var listKey : String = "shoppingKey"
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    func setList(){
        UserDefaults.standard.set(itemNames, forKey: listKey)
    }
     
        
        var list : [String]?{
            return (UserDefaults.standard.array(forKey: listKey) as! [String])
        }
    
    
    
    init(){
            setList()
    }
    
    }
    
    

    
    
    
    

