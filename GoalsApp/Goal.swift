//
//  Goal.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/22/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Foundation
import RealmSwift


class Goal: Object {
    
    //MARK: Properties 
    
    dynamic var title: String = ""
    dynamic var goalDescription: String = ""
    let progress = List<Progress>()
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
//    //MARK: Initialization
//    init(title: String, description: String) {
//        self.title = title
//        self.goalDescription = description
//    }
}
