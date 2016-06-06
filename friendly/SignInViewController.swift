//
//  SignInViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/5/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}