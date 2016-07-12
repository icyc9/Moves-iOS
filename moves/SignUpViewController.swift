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
    @IBOutlet weak var signUpFailureLabel: UILabel!
    
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signUp(sender: UIButton) {
        viewModel.signUserUp(usernameTextField.text!, password: passwordTextField.text!, emailOrPhone: emailOrPhoneTextField.text!, name: nameTextField.text!)
            .subscribeNext { signUpCode in
                switch signUpCode {
                case SignUpCode.InvalidEmailOrPhone:
                    self.signUpFailureLabel.backgroundColor = UIColor.whiteColor()
                    self.signUpFailureLabel.text = "Invalid email or phone"
                    break
                case SignUpCode.InvalidUsername:
                    self.signUpFailureLabel.backgroundColor = UIColor.whiteColor()
                    self.signUpFailureLabel.text = "Invalid username"
                    break
                case SignUpCode.Success:
                    // Sign up/in worked, take user to main app
                    let mainViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("my_moves")
                    
                    self.presentViewController(mainViewController, animated: true, completion: nil)
                    
                    break
                default:
                    self.signUpFailureLabel.backgroundColor = UIColor.whiteColor()
                    self.signUpFailureLabel.text = "An unknown error has occurred"
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    @IBAction func signIn(sender: UIButton) {
        
    }
}
