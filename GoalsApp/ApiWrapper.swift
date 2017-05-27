//
//  File.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/27/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Siesta

class ApiWrapper {
    
    let goalApi = GoalAPI()
    
    func postGoal(title: String, description: String) {
        var jsonData = [String: String]()
        jsonData["title"] = title
        jsonData["description"] = description
        goalApi.goals.request(.post, json: jsonData)
            .onSuccess { _ in print("Wow! Data!") }
            .onFailure { error in print("Oh, bummer.") }
    }
    
}
