//
//  CreateUserJob.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxAlamofire
import RxSwift
import RealmSwift

class CreateUserJob: MovesJob {
    private var restService: RestService
    private var authenticationService: AuthenticationService
    private var data: CreateUserJobData
    private var disposeBag: DisposeBag = DisposeBag()
    
    init(restService: RestService, authenticationService: AuthenticationService, data: CreateUserJobData) {
        self.restService = restService
        self.authenticationService = authenticationService
        self.data = data
    }
    
    func run() {
        restService.createUser(data)
            .observeOn(MainScheduler.instance)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: {(r, json) -> Void in
                if let dict = json as? [String: AnyObject] {
                    let accessToken = dict["access_token"]!
                    let user_id = dict["_id"]
                    print("Access token \(accessToken)")
                    
                    // Save off authentication token
                    self.authenticationService.setAuthToken(accessToken as! String)
                    
                    let realm = try! Realm()
                    
                    // Write user to the database
                    try! realm.write {
                        let model: UserModel = UserModel()
                        model.name = self.data.name
                        model.username = self.data.username
                        model.id = user_id as! String
                        realm.add(model)
                        
                        print("User wrote to database")
                    }
                }
            }, onError: {(e) -> Void in
                print(e)
            }).addDisposableTo(disposeBag)
    }
}