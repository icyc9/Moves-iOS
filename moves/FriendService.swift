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
    
    func addFriend(username: String) -> Observable<Void> {
        return restService.addFriend(username)
            .observeOn(MainScheduler.instance)
            .map({(response, json) -> Void in
                print(response)
                print(json)
                return Void()
            })
    }
    
    func getUserFriends() -> Observable<Results<UserModel>> {
        return Observable.create { observer in
            let realm = try! Realm()
            
            // Load friends from cache
            let results = realm.objects(UserModel.self).filter("id !='\(self.authenticationService.getUserId())'")
            
            if results.count != 0 {
                observer.onNext(results)
            }
            else {
                // Either user has no friends or cache is bad
                //                self.restService.getUserFriends()
                //                    .observeOn(MainScheduler.instance)
                //                    .subscribe(onNext: { (response, json) in
                //                        // TODO: Update cache
                //                        try! realm.write {
                //
                //                        }
                //                    })
            }
            
            return AnonymousDisposable {
                
            }
        }
    }
}