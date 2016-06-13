//
//  FriendService.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RealmSwift
import RxSwift

class FriendService {
    private var authenticationService: AuthenticationService
    private var restService: RestService
    
    init(authenticationService: AuthenticationService, restService: RestService) {
        self.authenticationService = authenticationService
        self.restService = restService
    }
    
    func getUserFriendsFromCache() -> Results<UserModel> {
        let realm = try! Realm()
        
        // Load friends from cache
        let results = realm.objects(UserModel.self).filter("id !='\(self.authenticationService.getUserId())'")
        
        return results
    }
    
    func getRequestingFriendsFromAPI() -> Observable<Results<UserModel>> {
        return restService.getPendingFriendRequestsFromOtherUsers()
            .map { (response, json) -> Realm in
                let realm = try! Realm()
                
                try realm.write {
                    // TODO: Database cache write
                }
                
                return realm
            }
            .map { realm -> Results<UserModel> in
                return self.getUserFriendsFromCache()
            }
    }
    
    func addFriend(username: String) -> Observable<DarwinBoolean> {
        return restService.addFriend(username)
            .observeOn(MainScheduler.instance)
            .map({(response, json) -> DarwinBoolean in
                print(response)
                print(json)
                
                if response.statusCode == 200 {
                    return true
                }
                
                return false
            })
    }
    
    func getUserFriendsFromAPI() -> Observable<Results<UserModel>> {
        return restService.getUserFriends()
            .map { (response, json) -> Void in
                if response.statusCode == 200 {
                    // Success
                    let realm = try! Realm()
                    try realm.write {
                       // TODO: write to db cache
                    }
                }
                
                return Void()
            }
            .map { (Void) -> Results<UserModel> in
                return self.getUserFriendsFromCache()
            }
    }
}