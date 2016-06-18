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
    
    func updateName(name: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        let body = [
            "_id": authenticationService.getUserId(),
            "name": name
        ];
        
        return requestJSON(.PATCH, url, headers: headers, parameters: body, encoding: .JSON)
    }
    
    func markAsNotDownToHang(hangoutId: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/denied"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        return requestJSON(.PATCH, url, headers: headers, encoding: .JSON)
    }
    
    func markAsDownToHang(hangoutId: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/available"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        return requestJSON(.PATCH, url, headers: headers, encoding: .JSON)
    }
    
    func sendPrivateMoveToFriends(hangoutId: String, friendUsernames: [String]) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout/\(hangoutId)/send"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "users": friendUsernames
        ];
        
        return requestJSON(.POST, url, headers: headers, parameters: body, encoding: .JSON)
    }
    
    func createMove(message: String, scope: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/authenticate"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "message": message,
            "scope": scope
        ];
        
        return requestJSON(.PUT, url, headers: headers, parameters: body, encoding: .JSON)
    }
    
    func addFriend(username: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/friends"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        let body = [
            "friend_username": username
        ];
        
        return requestJSON(.PATCH, url, headers: headers, parameters: body, encoding: .JSON)
    }
    
    func getUserFriends() -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/friends"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        return requestJSON(.GET, url, headers: headers, encoding: .JSON)
    }
    
    func getUserByUsername(username: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user?username=\(username)"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        return requestJSON(.GET, url, headers: headers, encoding: .JSON)
    }
    
    func getFriendsInPhoneBook(phoneNumber: String) {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user?phone_number=\(phoneNumber)"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        Alamofire.request(.GET, url, headers: headers, encoding: .JSON)
            .validate()
            .responseJSON { response in
                print("Response JSON: \(response)")
        }
    }
    
    func getUserMoves(scope: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/hangout?scope=\(scope)"
        let headers = ["Content-Type": "application/json", "JWT-Auth": "Bearer \(authenticationService.getAuthToken())"]
        
        return requestJSON(.GET, url, headers: headers, encoding: .JSON)
    }
    
    func authenticate(username: String, password: String) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/authenticate"
        let headers = ["Content-Type": "application/json", "JWT-Auth": basicAuthHeader(username, password: password)]
        
        return requestJSON(.POST, url, headers: headers, encoding: .JSON)
    }
    
    private func basicAuthHeader(username: String, password: String) -> String {
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        
        return "Basic \(base64Credentials)"
    }
    
    func getPendingFriendRequestsFromOtherUsers() -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user/friends?pending=true"
        let headers = ["Content-Type": "application/json"]
        
        return requestJSON(.GET, url, headers:headers,
                           encoding: .JSON)
    }
    
    func createUser(data: CreateUserJobData) -> Observable<(NSHTTPURLResponse, AnyObject)> {
        let url = "http://moves-api.us-east-1.elasticbeanstalk.com/user"
        let headers = ["Content-Type": "application/json"]
        
        let parameters = [
            "id": NSUUID().UUIDString,
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
