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
            $0.headers["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE0OTU4OTgwNTMsImV4cCI6MTQ5NTk4NDQ1M30.dt3iX3juhi7fFvLdB6xuGoHtWj6hxb6euKtpnvLDdx0"
        }
    }
    
    var goals: Resource { return resource("/goals") }
}
