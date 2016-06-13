//
//  PrivateMoveModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RealmSwift

class PrivateMoveModel: Object {
    static let STATE_SYNCING = "STATE_SYNCING"
    static let STATE_SYNC_FAILURE = "STATE_SYNC_FAILURE"
    static let STATE_SYNC_SUCCESS = "STATE_SYNC_SUCCESS"
    
    dynamic var id = ""
    dynamic var messsage = ""
    dynamic var state = ""
    dynamic var numberOfPeopleGoing = 0
    dynamic var numberOfFriendsGoing = 0
    
    override static func primaryKey() -> String {
        return "id"
    }
}