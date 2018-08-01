//
//  RealmObject.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-07-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object {
    @objc dynamic var firstname : String? = nil
    var lastname : String? = nil
    
}
extension User {
    func writeToRealm() {
        let uiRealm = try! Realm()
        try! uiRealm.write {
            uiRealm.add(self)
        }
    }
}
