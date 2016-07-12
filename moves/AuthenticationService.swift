//
//  AuthenticationService.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import Locksmith

class AuthenticationService {
    
    func authenticate(authToken: String, userId: String) {
        do {
            try Locksmith.updateData(["authToken": authToken, "userId": userId], forUserAccount: "Moves")
        } catch {
            print("Unable to set auth token")
        }
    }
    
    func getUserId() -> String {
        if let x = Locksmith.loadDataForUserAccount("Moves") {
            if let y = x["userId"] {
                return y as! String
            }
        }
        
        return ""
    }
    
    func getAuthToken() -> String {
        if let x = Locksmith.loadDataForUserAccount("Moves") {
            if let y = x["authToken"] {
                return y as! String
            }
        }
        
        return ""
    }
}