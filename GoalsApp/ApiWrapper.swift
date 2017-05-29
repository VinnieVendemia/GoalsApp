//
//  File.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/27/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//
// This class is intended to contain logic needed to prepare
// requests and subsequently send data to the API.

import Siesta

class ApiWrapper {
    
    let goalApiService = GoalAPIService()
    
    func postGoal(title: String, description: String) {
        var jsonData = [String: String]()
        jsonData["title"] = title
        jsonData["description"] = description
        goalApiService.goals.request(.post, json: jsonData)
            .onSuccess { _ in print("Wow! Data!") }
            .onFailure { error in print("Oh, bummer.") }
    }
    
    func postUser(username: String, password: String, handleResponse: @escaping (Bool, String) -> (Void)  ) {
        var jsonData = [String: String]()
        jsonData["username"] = username
        jsonData["password"] = password
        jsonData["admin"] = "" // Not important for now
        goalApiService.users.request(.post, json: jsonData)
            .onSuccess { _ in handleResponse(true, "") }
            .onFailure { error in handleResponse(false, error.userMessage) }
    }
}

let apiWrapper = ApiWrapper()
