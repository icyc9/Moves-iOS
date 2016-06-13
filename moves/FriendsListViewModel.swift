//
//  FriendsListViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/13/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RealmSwift
import RxSwift

class FriendsListViewModel {
    private var friendService: FriendService
    
    init(friendService: FriendService) {
        self.friendService = friendService
    }
    
    func getFriendsFromCache() {
        
    }
}