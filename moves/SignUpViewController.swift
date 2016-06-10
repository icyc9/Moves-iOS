//
//  SignUpViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/7/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import Alamofire
import TextFieldEffects
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: KaedeTextField!
    @IBOutlet weak var nameTextField: KaedeTextField!
    @IBOutlet weak var passwordTextField: KaedeTextField!
    @IBOutlet weak var emailOrPhoneTextField: KaedeTextField!
    
    private var viewModel: SignUpViewModel = SignUpViewModel(userService: UserService(restService: RestService(authenticationService: AuthenticationService()),
        authenticationService: AuthenticationService()))
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = Color.primary
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        usernameTextField.text = (NSUUID().UUIDString as NSString).substringWithRange(NSRange(location: 0, length: 4))
        nameTextField.text = "Dan"
        passwordTextField.text = "password"
        emailOrPhoneTextField.text = (NSUUID().UUIDString as NSString).substringWithRange(NSRange(location: 0, length: 4)) + "@live.com"
        
        viewModel.signInState.subscribe(onNext: { signUpSuccess in
            if signUpSuccess.boolValue {
                // Sign up/in worked, take user to main app
                let mainViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("my_moves")
                
                self.presentViewController(mainViewController, animated: true, completion: nil)
                
            }
        }).addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signUp(sender: UIButton) {
        viewModel.signUserUp(usernameTextField.text!, password: passwordTextField.text!, emailOrPhone: emailOrPhoneTextField.text!, name: nameTextField.text!)
    }
    
    @IBAction func signIn(sender: UIButton) {
        
    }
}
