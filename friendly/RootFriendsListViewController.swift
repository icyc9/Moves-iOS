//
//  RootFriendsListViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class RootFriendsListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}