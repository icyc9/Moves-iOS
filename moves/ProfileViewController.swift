//
//  ProfileViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import TextFieldEffects
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var friendUsernameTextField: KaedeTextField!
    @IBOutlet weak var usernameTextView: UILabel!
    @IBOutlet weak var nameTextView: KaedeTextField!
    @IBOutlet weak var friendsNumberLabel: UIButton!
    @IBOutlet weak var tap: UIButton!
    
    private var disposeBag = DisposeBag()
    
    private var profileViewModel: ProfileViewModel = ProfileViewModel(friendService: FriendService(authenticationService: AuthenticationService(), restService: RestService(authenticationService: AuthenticationService())), userService: UserService(restService: RestService(authenticationService: AuthenticationService()),
        authenticationService: AuthenticationService()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendUsernameTextField.delegate = self
        addFriendButton.layer.cornerRadius = 5
        navigationController?.navigationBar.barTintColor = Color.primary
        
        profileViewModel.username.bindTo(usernameTextView.rx_text).addDisposableTo(disposeBag)
        profileViewModel.name.bindTo(nameTextView.rx_text).addDisposableTo(disposeBag)
        
        profileViewModel.getUserDetails()
    }
    
    @IBAction func updateName(sender: UIButton) {
        // Update model
        profileViewModel.updateName(usernameTextView.text!)
            .subscribeNext { (success) in
                if success {
                    print("Update name success")
                }
                else {
                    print("Failed to update name")
                }
            }.addDisposableTo(disposeBag)
    }
    
    @IBAction func viewFriendRequests(sender: UIButton) {
        
    }
    
    @IBAction func addFriend(sender: UIButton) {
        profileViewModel.addFriend(friendUsernameTextField.text!)
            .subscribeNext { (success) in
                if success {
                    print("Add friend success")
                }
                else {
                    print("Failed to add friend")
                }
            }.addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signOut(sender: UIButton) {
        profileViewModel.signOut()
        navigationController?.popViewControllerAnimated(true)
        
        let storyboard = UIStoryboard(name: "SignInOrUp", bundle: nil)
        let signUpViewController = storyboard.instantiateViewControllerWithIdentifier("sign_up")
        
        presentViewController(signUpViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
