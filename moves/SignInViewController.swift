//
//  SignInViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/5/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import TextFieldEffects

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var usernameTextField: KaedeTextField!
    @IBOutlet weak var passwordTextField: KaedeTextField!
    
    var viewModel = SignInViewModel(userService: UserService(restService: RestService(authenticationService: AuthenticationService()), authenticationService: AuthenticationService()))
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signIn(sender: AnyObject) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if username == "" || username == nil {
            // Show message saying to set username
        }
        else if password == "" || password == nil {
            // Show message saying to set password
        }
        else {
            // All good, sign in
            viewModel.signIn(username!, password: password!)
                .subscribeNext({ (success) in
                    if success {
                        // Show main view controller after login
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = storyboard.instantiateInitialViewController()
                        self.presentViewController(viewController!, animated: true, completion: nil)
                    }
                    else {
                        print("Sign in failure")
                    }
                }).addDisposableTo(disposeBag)
        }
    }
}