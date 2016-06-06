//
//  SignUpViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/5/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}