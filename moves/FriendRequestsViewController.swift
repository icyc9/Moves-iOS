//
//  FriendRequestsViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class FriendRequestsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setUpPullToRefresh(Color.primaryDark)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }

}
