//
//  GoalsAppTests.swift
//  GoalsAppTests
//
//  Created by Vinnie Vendemia on 3/29/17.
//  Copyright (c) 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import XCTest

@testable import GoalsApp

class GoalsAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    // MARK: Goal object tests 
    func testGoalInitializationSucceeds() {
        let notNilGoal = Goal.init(title: "Goal 1", description: "Describing goal 1")
        XCTAssertNotNil(notNilGoal)
    }
    
}
