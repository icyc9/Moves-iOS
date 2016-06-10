//
//  SignUpViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpViewModel {
    private var userService: UserService
    var signInState = BehaviorSubject<DarwinBoolean>(value: false)
    private var disposeBag = DisposeBag()
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func signUserUp(username: String, password: String, emailOrPhone: String, name: String) {
        userService.createUser(CreateUserJobData(username: username, password: password, name: name, emailOrPhone:emailOrPhone))
            .subscribe(onNext: { user in
                if user != nil {
                    print("sign up success")
                    dispatch_async(dispatch_get_main_queue()) {
                        self.signInState.onNext(true)
                    }
                }
                else {
                    print("sign up failure")
                    dispatch_async(dispatch_get_main_queue()) {
                        self.signInState.onNext(false)
                    }
                }
            })
            .addDisposableTo(disposeBag)
    }
}