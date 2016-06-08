//
//  CreateUserJob.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Foundation

class CreateUserJob: MovesJob {
    private var restService: RestService
    private var data: CreateUserJobData?
    private var userRepository: UserRepository
    
    init(restService: RestService, data: CreateUserJobData, userRepository: UserRepository) {
        self.restService = restService
        self.data = data
        self.userRepository = userRepository
    }
    
    func run() {
        restService.createUser(data!)
    }
}