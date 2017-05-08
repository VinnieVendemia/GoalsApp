//
//  Progress.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/6/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Foundation
import RealmSwift

class Progress: Object {
    
    dynamic var progressDesciption: String = ""
    dynamic var date: Date = Date.init()
    dynamic var scale: Int = 1
    
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

}
