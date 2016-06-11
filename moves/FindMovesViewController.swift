//
//  MovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class FindMovesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setUpPullToRefresh(Color.primaryDark)
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barTintColor = Color.primary
        navigationBar?.topItem?.title = "What your friends want to do"
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    deinit {
        self.tableView.dg_removePullToRefresh()
    }
    
}
