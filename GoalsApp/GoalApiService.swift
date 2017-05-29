//
//  GoalApi.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/26/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Siesta

class GoalAPIService: Service {
    init() {
        super.init(baseURL: Constants.api_url)
        
        
        configure {
            // TODO: Configure based on user-authenticated token
            $0.headers["token"] = ""
        }
    }
    
    var goals: Resource { return resource("/goals") }
    var users: Resource { return resource("/users") }
    var auth: Resource { return resource("/authenticate") }
}
