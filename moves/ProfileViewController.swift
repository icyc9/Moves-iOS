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
    
    private var profileViewModel: ProfileViewModel = ProfileViewModel(userService: UserService(restService: RestService(authenticationService: AuthenticationService()),
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func viewDidAppear(animated: Bool) {
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(true, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(true, pageViewController: horizontalPageController)
    }
    
    @IBAction func viewFriends(sender: UIButton) {
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(false, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(false, pageViewController: horizontalPageController)
    }
    
    private func toggleScrollOnPageViewController(scrollEnabled: Bool, pageViewController: UIPageViewController) {
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.scrollEnabled = scrollEnabled
            }
        }
    }
}
