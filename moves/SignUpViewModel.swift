//
//  SignUpViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Foundation

class SignUpViewModel {
    private var userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func signUserUp(username: String, password: String, emailOrPhone: String, name: String) {
        userService.createUser(CreateUserJobData(username: username, password: password, name: name, emailOrPhone: emailOrPhone))
    }
}