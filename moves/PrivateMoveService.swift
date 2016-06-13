//
//  PrivateMoveService.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RealmSwift

class PrivateMoveService {
    private var restService: RestService
    
    init(restService: RestService) {
        self.restService = restService
    }
    
    func getPrivateMovesFromCache() -> Results<PrivateMoveModel> {
        let realm = try! Realm()
        return realm.objects(PrivateMoveModel.self)
    }
    
    func getPrivateMovesFromAPI() -> Observable<Results<PrivateMoveModel>> {
        return restService.getUserMoves("user")
            .map { (response, json) -> Results<PrivateMoveModel> in
                if response.statusCode == 200 {
                    // All went well, update cache
                    let realm = try! Realm()
                    
                    try realm.write {
                        // TODO: Update cache
                    }
                }
                
                // Regardless if it worked or not, return the last valid data
                return self.getPrivateMovesFromCache()
            }
    }
    

    func getPrivateMovesFromAPI() -> Void {
        restService.getUserMoves("user")
            .observeOn(MainScheduler.instance)
            .subscribeNext { (response, json) in
                print(response)
            }
    }
    
    func getPrivateMovesTimelineFromCache() -> Results<PrivateMoveModel> {
        let realm = try! Realm()
        
        // Load moves in from cache
        return realm.objects(PrivateMoveModel.self)
    }
    
    //    func getUsersInMove() -> Observable<Results<UserModel>> {
    //
    //    }
    
    func decline(moveId: String) -> Observable<DarwinBoolean> {
        return restService.markAsNotDownToHang(moveId)
            .map({ (response, json) -> DarwinBoolean in
                if response.statusCode == 200 {
                    return true
                }
                
                return false
            })
    }
    
    func accept(moveId: String) -> Observable<DarwinBoolean> {
        return restService.markAsDownToHang(moveId)
            .map({ (response, json) -> DarwinBoolean in
                if response.statusCode == 200 {
                    return true
                }
                
                return false
            })
    }
    
    func send(moveMessage: String, hangoutId: String, friendUsernames: [String]) -> Observable<DarwinBoolean> {
        let realm = try! Realm()
       
        do {
            try realm.write {
                let model = PrivateMoveModel()
                model.messsage = moveMessage
                realm.add(model)
            }
        } catch {
            print("An error has occurred writing to db")
            return Observable.just(false)
        }
        
        return restService.sendPrivateMoveToFriends(hangoutId, friendUsernames: friendUsernames)
            .map { (response, json) -> DarwinBoolean in
                if response.statusCode == 200 {
                    return true
                }
                
                return false
            }
    }
    
    func createMove(message: String, scope: String) -> Observable<DarwinBoolean> {
        return restService.createMove(message, scope: scope)
            .observeOn(MainScheduler.instance)
            .map({ (response, json) -> DarwinBoolean in
                guard response.statusCode == 200 else {
                    return false
                }
                
                return true
            })
    }
}