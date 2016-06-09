//
//  AuthenticationService.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Locksmith

class AuthenticationService {
    
    func setAuthToken(authToken: String) {
        do {
            try Locksmith.saveData(["authToken": authToken], forUserAccount: "Moves")
        } catch {
            print("Unable to set auth token")
        }
    }
    
    func getAuthToken() -> String {
        return String(Locksmith.loadDataForUserAccount("Moves")!["authToken"])
    }
}