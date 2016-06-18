//
//  UserService.swift
//  moves
//
//  Created by Daniel Christopher on 6/9/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RealmSwift

class UserService {
    private var restService: RestService
    private var authenticationService: AuthenticationService
    private var disposeBag: DisposeBag = DisposeBag()
    
    init(restService: RestService, authenticationService: AuthenticationService) {
        self.restService = restService
        self.authenticationService = authenticationService
    }
    
    func signIn(username: String, password: String) -> Observable<DarwinBoolean> {
        return restService.authenticate(username, password: password)
            .observeOn(MainScheduler.instance)
            .map({ (response, json) -> DarwinBoolean in
                guard response.statusCode == 200 else {
                    return false
                }
                
                if let data = json as? [String: AnyObject] {
                    self.authenticationService.authenticate(data["access_token"] as! String, userId: data["_id"] as! String)
                    return true
                }
                
                return false
            })
    }
    
    func updateName(name: String) -> Observable<DarwinBoolean> {
        return restService.updateName(name)
            .observeOn(MainScheduler.instance)
            .map({(response, json) -> DarwinBoolean in
                guard response.statusCode == 200 else {
                    return false
                }
                
                let realm = try! Realm()
                let model = self.getSignedInUserFromCache()
                
                // Write user to the database
                try! realm.write {
                    model!.name = name
                }
                
                return true
            })
    }

    func getUserByUsername(username: String) -> Observable<UserModel> {
        print(authenticationService.getAuthToken())
        return restService.getUserByUsername(username)
            .observeOn(MainScheduler.instance)
            .map({(response, json) -> UserModel in
                if let data = json as? Array<[String: AnyObject]> {
                    let model = UserModel()
                    model.id = data[0]["_id"] as! String
                    model.name = data[0]["name"] as! String
                    model.username = data[0]["username"] as! String
                    
                    return model
                }
                
                // Something went wrong, just grab user from cache
                if let user = self.getSignedInUserFromCache() {
                    return user
                }
                
                // At this point just return a blank model
                return UserModel()
            })
    }
    
    func getSignedInUserFromCache() -> UserModel? {
        let realm = try! Realm()
        return realm.objects(UserModel.self).filter("id = '\(authenticationService.getUserId())'").first
    }
    
    func signUserOut() {
        authenticationService.authenticate("", userId: "")
    }
    
    func createUser(data: CreateUserJobData) -> Observable<(UserModel?, SignUpCode)> {
        return restService.createUser(data)
            .observeOn(MainScheduler.instance)
            .map({(r, json) -> (UserModel?, SignUpCode) in
                guard r.statusCode == 201 else {
                    return (nil, SignUpCode.UnknownFailure)
                }
                
                if let dict = json as? [String: AnyObject] {
                    let signUpResultCode = dict["sign_up_result"] as! Int
                    
                    guard signUpResultCode == SignUpCode.InvalidEmailOrPhone.rawValue else {
                        return (nil, SignUpCode.InvalidEmailOrPhone)
                    }
                    
                    guard signUpResultCode == SignUpCode.InvalidUsername.rawValue else {
                        return (nil, SignUpCode.InvalidUsername)
                    }
                    
                    guard signUpResultCode == SignUpCode.UnknownFailure.rawValue else {
                        return (nil, SignUpCode.UnknownFailure)
                    }
                    
                    let accessToken = dict["access_token"]
                    let user_id = dict["_id"]
                    
                    // Save off authentication token
                    self.authenticationService.authenticate(accessToken as! String, userId: user_id as! String)
                    
                    let realm = try! Realm()
                    var model: UserModel? = nil
                    
                    // Write user to the database
                    try! realm.write {
                        model = UserModel()
                        model!.name = data.name
                        model!.username = data.username
                        model!.id = user_id as! String
                        realm.add(model!)
                        print("User wrote to database")
                    }
                    
                    print("Auth token: \(self.authenticationService.getAuthToken()))")
                    
                    return (model, SignUpCode.Success)
                }
                
                return (nil, SignUpCode.UnknownFailure)
            })
    }
}