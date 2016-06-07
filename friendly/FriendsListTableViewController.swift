//
//  FriendsListTableViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = Color.primary
    }
}