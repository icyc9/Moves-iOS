//
//  RestService.swift
//  moves
//
//  Created by Daniel Christopher on 6/8/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//
import Alamofire
import RxAlamofire
import RxSwift

class RestService {
    private var authenticationService: AuthenticationService
    
    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }
    
    func markAsNotDownToHang(hangoutId: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/denied"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.PATCH, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func markAsDownToHang(hangoutId: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/available"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.PATCH, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func sendMove(hangoutId: String, friendIds: [String]) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/send"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "users": friendIds
        ];
        
        Alamofire.request(.POST, url, headers: headers, parameters: body, encoding: .JSON)
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func createMove(message: String, scope: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/authenticate"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "message": message,
            "scope": scope
        ];
        
        Alamofire.request(.POST, url, headers: headers, parameters: body, encoding: .JSON)
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func addFriend(username: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/friends"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "friend_id": username
        ];
        
        Alamofire.request(.PATCH, url, headers: headers, parameters: body, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func getUserFriends() {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/friends"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.GET, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func getUserByUsername(username: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user?username=x"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.GET, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func getFriendsInPhoneBook(phoneNumber: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user?phone_number=\(phoneNumber)"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.GET, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func getUserMoves(scope: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout?scope=\(scope)"
        let headers = ["JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.GET, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func authenticate(username: String, password: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/authenticate"
        let headers = ["JWT-Auth": basicAuthHeader(username, password: password)]
        
        Alamofire.request(.POST, url, headers: headers, encoding: .JSON)
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    private func basicAuthHeader(username: String, password: String) -> String {
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        
        return "Basic \(base64Credentials)"
    }
    
    func createUser(data: CreateUserJobData) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user"
        let headers = ["Content-Type": "application/json"]
        
        let parameters = [
            "name": data.name,
            "username": data.username,
            "password": data.password,
            "email": data.emailOrPhone,
            "phone_number": "7033623714" // hardcoded until api change
        ]
        
        return requestJSON(.POST, url, parameters: parameters, headers:headers,
                           encoding: .JSON)
    }
}
