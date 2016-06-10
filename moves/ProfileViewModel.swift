//
//  ProfileViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RxSwift
import RxCocoa

class ProfileViewModel {
    private var userService: UserService
    var username = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func getUserDetails() {
        if let userModel = userService.getSignedInUserFromCache() {
            print(userModel.name)
            print(userModel.username)
            dispatch_async(dispatch_get_main_queue()) {
                self.name.onNext(userModel.name)
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.username.onNext(userModel.username)
            }
        }
    }
}