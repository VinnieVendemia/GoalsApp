//
//  GoalsViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/21/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import Charts

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
        cell.descriptionLabel.text = goal.goalDescription
        cell.goalLineChartView.data = updateChartWithData();
        
        // Configure the cell...
        
        return cell
    }
    
    
    //MARK: Private Methods
    private func loadSampleGoals() {
        let goal1 = Goal()
        goal1.title = "Test Goal"
        goal1.goalDescription = "Test Goal Description"
        goal1.save()

        goals += [goal1]
    }
    
    func updateChartWithData() -> LineChartData {
        var dataEntries: [ChartDataEntry] = []
        let dataEntry = ChartDataEntry(x: 2.0, y: 4.0)
        let dataEntry2 = ChartDataEntry(x: 4.0, y: 6.0)
        dataEntries.append(dataEntry)
        dataEntries.append(dataEntry2)
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Goal count")
        let chartData = LineChartData(dataSet: chartDataSet)
        return chartData
    }
}
