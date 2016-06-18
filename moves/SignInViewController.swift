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
    @IBOutlet weak var signInFailure: UILabel!
    
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
            self.showInvalidUsernameOrPasswordError()
        }
        else if password == "" || password == nil {
            // Show message saying to set password
            self.showInvalidUsernameOrPasswordError()
        }
        else {
            // All good, sign in
            viewModel.signIn(username!, password: password!)
                .subscribeNext({ result in
                    switch result {
                    case SignInCode.InvalidCredentials:
                        self.showInvalidUsernameOrPasswordError()
                        break
                    case SignInCode.Success:
                        self.goToMainApp()
                        break
                    default:
                        self.signInFailure.text = "An unknown error has occurred"
                        break
                    }
                }).addDisposableTo(disposeBag)
        }
    }
    
    private func showInvalidUsernameOrPasswordError() {
        self.signInFailure.backgroundColor = UIColor.whiteColor()
        self.signInFailure.text = "Invalid username or password"
    }
    
    private func goToMainApp() {
        // Show main view controller after login
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        self.presentViewController(viewController!, animated: true, completion: nil)
    }
}