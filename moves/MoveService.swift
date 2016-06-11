//
//  MoveService.swift
//  moves
//
//  Created by Daniel Christopher on 6/9/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RealmSwift

class MoveService {
    private var restService: RestService
    
    init(restService: RestService) {
        self.restService = restService
    }
    
//    func getUserMoves() -> AnyRealmCollection<MoveModel> {
////        restService.getUserMoves("user")
////            .observeOn(MainScheduler.instance)
////            .map({ (response, json) -> UserModel in
////                if let data = json as? Array<[String: AnyObject]> {
////                    let accessToken = data["access_token"]
////                    let user_id = data["_id"]
////                    
////                    // Save off authentication token
////                    self.authenticationService.authenticate(accessToken as! String, userId: user_id as! String)
////                    
////                    let realm = try! Realm()
////                    var model: UserModel? = nil
////                    
////                    // Write user to the database
////                    try! realm.write {
////                        model = UserModel()
////                        model!.name = data.name
////                        model!.username = data.username
////                        model!.id = user_id as! String
////                        realm.add(model!)
////                        print("User wrote to database")
////                    }
////                    
////                    print("Auth token: \(self.authenticationService.getAuthToken()))")
////                    
////                    return model
////                }
////            })
//    }
    
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