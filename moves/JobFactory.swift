//
//  JobFactory.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Foundation

class JobFactory {
    private var restService: RestService
    private var authenticationService: AuthenticationService
    
    init(restService: RestService, authenticationService: AuthenticationService) {
        self.restService = restService
        self.authenticationService = authenticationService
    }
    
    func enqueueJob(job: MovesJob) {
        job.run()
    }
    
    func createUserJob(username: String, password: String, name: String, emailOrPhone: String) -> CreateUserJob {
        let data = CreateUserJobData(username: username, password: password, name: name, emailOrPhone: emailOrPhone)
        
        return CreateUserJob(restService: restService, authenticationService: authenticationService, data: data)
    }
}