//
//  Goal.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/22/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class Goal {
    
    //MARK: Properties 
    
    var title: String
    var description: String
    
    //MARK: Initialization
    init?(title: String, description: String) {
        
        if title.isEmpty || description.isEmpty {
            return nil
        }
        
        self.title = title
        self.description = description
    }
}
