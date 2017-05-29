//
//  User.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/29/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var username: String = ""
    dynamic var password: String = ""
    dynamic var token: String = ""
    
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

