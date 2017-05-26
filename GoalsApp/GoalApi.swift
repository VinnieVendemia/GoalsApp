//
//  GoalApi.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/26/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Siesta

class GoalAPI: Service {
    init() {
        super.init(baseURL: Constants.api_url)
    }
    
    var goals: Resource { return resource("/goals") }
}

let goalApi = GoalAPI()
