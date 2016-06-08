//
//  SignUpViewModel.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Foundation

class SignUpViewModel {
    private var jobFactory: JobFactory
    
    init(jobFactory: JobFactory) {
        self.jobFactory = jobFactory
    }
    
    func signUserUp(username: String, password: String, emailOrPhone: String, name: String) {
        let job = jobFactory.createUserJob(username, password: password, name: name, emailOrPhone: emailOrPhone)
        jobFactory.enqueueJob(job)
    }
}