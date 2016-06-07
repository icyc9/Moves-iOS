//
//  UserMovesTableViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class UserMovesTableViewController:PullToRefreshTableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar?.barTintColor = Color.primary
        navigationBar?.topItem?.title = "My Moves"
    }
}