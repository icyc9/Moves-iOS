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

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: KaedeTextField!
    @IBOutlet weak var nameTextField: KaedeTextField!
    @IBOutlet weak var passwordTextField: KaedeTextField!
    @IBOutlet weak var emailOrPhoneTextField: KaedeTextField!
    
    private var viewModel: SignUpViewModel = SignUpViewModel(jobFactory: JobFactory(restService: RestService(authenticationService: AuthenticationService()), userRepository: UserRepository()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = Color.primary
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
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
