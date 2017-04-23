//
//  HomeViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/21/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    //MARK: Properties
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleGoals()
    }
    
    
    
    //MARK: Private Methods
    private func loadSampleGoals() {
        let goal1 = Goal(title: "Test Goal", description: "Test Goal Description")
        
        let goal2 = Goal(title: "Test Goal 2", description: "Test Goal Description 2")
        
        goals += [goal1, goal2]
    }
}
