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
    var disposeBag = DisposeBag()
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func updateUsername(username: String) {
        userService.updateUsername(username)
            .subscribe(onNext: { success in
                if success {
                    print("Username updated")
                }
                else {
                    print("Username failed to update")
                }
            }).addDisposableTo(disposeBag)
    }
    
    func addFriend(username: String) {
        userService.addFriend(username)
            .subscribe(onNext: {
                print("friend added")
            }).addDisposableTo(disposeBag)
    }
    
    func getUserDetails() {
        var username = ""
        
        if let userModel = userService.getSignedInUserFromCache() {
            username = userModel.username
            dispatch_async(dispatch_get_main_queue()) {
                self.name.onNext(userModel.name)
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.username.onNext(userModel.username)
            }
        }
        
        // Invalidate cache
        userService.getUserByUsername(username)
            .subscribe(onNext: {user -> Void in
                self.name.onNext(user.name)
                self.username.onNext(user.username)
            }).addDisposableTo(disposeBag)
    }
}