//
//  RootFriendsListViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class RootFriendsListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setUpPullToRefresh(Color.primaryDark)
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}