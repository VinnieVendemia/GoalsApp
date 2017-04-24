//
//  GoalsViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/21/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class GoalsViewController: UITableViewController {
    
    //MARK: Properties
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleGoals()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GoalTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GoalTableViewCell  else {
            fatalError("The dequeued cell is not an instance of GoalTableViewCell.")
        }
        
        let goal = goals[indexPath.row]
        
        cell.titleLable.text = goal.title
        cell.descriptionLabel.text = goal.description
        
        // Configure the cell...
        
        return cell
    }
    
    
    //MARK: Private Methods
    private func loadSampleGoals() {
        let goal1 = Goal(title: "Test Goal", description: "Test Goal Description")
        
        let goal2 = Goal(title: "Test Goal 2", description: "Test Goal Description 2")
        
        goals += [goal1, goal2]
    }
}
