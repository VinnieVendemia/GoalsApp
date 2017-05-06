//
//  GoalsViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/21/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

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
        configureChartView(goalLineChartView: cell.goalLineChartView)
        
        // Configure the cell...
        
        return cell
    }
    
    private func configureChartView(goalLineChartView: LineChartView){
        goalLineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInCubic)
        goalLineChartView.xAxis.drawAxisLineEnabled = false
        goalLineChartView.chartDescription?.text = ""
        goalLineChartView.isUserInteractionEnabled = false
    }
    
    
    //MARK: Private Methods
    private func updateChartWithData() -> LineChartData {
        let dataEntries: [ChartDataEntry] = addTestData()
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Goal Progress")
        chartDataSet.colors = [UIColor.blue];
        chartDataSet.drawCubicEnabled = true
        chartDataSet.drawFilledEnabled = true
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSet: chartDataSet)
        return chartData
    }
    
    //MARK: Remove after testing
    private func addTestData() -> [ChartDataEntry] {
        var dataEntries: [ChartDataEntry] = []
        for index in 1...10 {
            let y = Double(arc4random_uniform(10));
            let dataEntry = ChartDataEntry(x: Double(index), y: y)
            dataEntries.append(dataEntry)
        }
        
        return dataEntries;
    }
    
    private func sampleProgress(progress: List<Progress>){
        let p1 = Progress()
        p1.progressDesciption = "P 1"
        p1.date = Date.init()
        
        
        let p2 = Progress()
        p2.progressDesciption = "p 2"
        p2.date = Date.init()

        progress.append(p1)
        progress.append(p2)
    }
    
    private func loadSampleGoals() {
        let goal1 = Goal()
        goal1.title = "Test Goal"
        goal1.goalDescription = "Test Goal Description"
        sampleProgress(progress: goal1.progress)
        goal1.save()
        
//        let goal2 = Goal()
//        goal2.title = "Test Goal 2"
//        goal2.goalDescription = "Test Goal 2 Description"
//        goal2.save()
        
        goals += [goal1]
    }
}
