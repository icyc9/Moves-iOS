//
//  SignInViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/17/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import RealmSwift
import RxSwift
import RxCocoa
import RxViewModel

class SignInViewModel {
    var userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func signIn(username: String, password: String) -> Observable<SignInCode> {
        return userService.signIn(username, password: password)
            .observeOn(MainScheduler.instance)
    }
}