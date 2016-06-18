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
    
    func signUserUp(username: String, password: String, emailOrPhone: String, name: String) -> Observable<SignUpCode> {
        return userService.createUser(CreateUserJobData(username: username, password: password, name: name, emailOrPhone:emailOrPhone))
            .observeOn(MainScheduler.instance)
            .map({ model -> SignUpCode in
                return model.1
            })
    }
}