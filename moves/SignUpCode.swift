//
//  SignUpCode.swift
//  moves
//
//  Created by Daniel Christopher on 6/18/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

enum SignUpCode: Int {
    case Success = 0
    case InvalidUsername = 1
    case InvalidEmailOrPhone = 2
    case UnknownFailure = 3
}