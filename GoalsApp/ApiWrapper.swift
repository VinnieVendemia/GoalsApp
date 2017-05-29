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
    
    // TODO: Once the service is updated, ensure that the token can be parsed from the success 
    // message, and returned via the 'handleResponse' closure
    func postUser(username: String, password: String, handleResponse: @escaping (Bool, String) -> (Void)  ) {
        var jsonData = [String: String]()
        jsonData["username"] = username
        jsonData["password"] = password
        jsonData["admin"] = "" // Not important for now
        goalApiService.users.request(.post, json: jsonData)
            .onSuccess { success in handleResponse(true, success.jsonDict["token"] as! String) }
            .onFailure { error in handleResponse(false, error.userMessage) }
    }
    
    func authUser(username: String, password: String) {
        var jsonData = [String: String]()
        jsonData["username"] = username
        jsonData["password"] = password
        goalApiService.auth.request(.post, json: jsonData)
            .onSuccess { _ in print("AUTH") }
            .onFailure { error in print("FAIL") }
    }

}

let apiWrapper = ApiWrapper()
