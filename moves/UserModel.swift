//
//  UserModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//
import RealmSwift
import Realm

class UserModel: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var username = ""
    dynamic var isBestFriend = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}