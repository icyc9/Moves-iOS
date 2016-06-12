//
//  WhoIsDownTableViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/12/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import RealmSwift

class OpenMoveJoinRequestTableViewCell: UITableViewCell {
    
}

class WhoIsDownTableViewController: UITableViewController {
    private var friends: Results<UserModel>?
    private var viewModel: WhoIsDownViewModel = WhoIsDownViewModel(moveService: MoveService(restService: RestService(authenticationService: AuthenticationService())), userService: UserService(restService: RestService(authenticationService: AuthenticationService()), authenticationService: AuthenticationService()))
    
    override func viewDidLoad() {
        tableView.setUpPullToRefresh(Color.primaryDark)
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar?.tintColor = UIColor.whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      //  let friend = friends![indexPath.item]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "OpenMoveJoinRequestTableViewCell", forIndexPath: indexPath)
            as? OpenMoveJoinRequestTableViewCell
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if friends != nil {
            return friends!.count
        }
        
        return 4
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
}