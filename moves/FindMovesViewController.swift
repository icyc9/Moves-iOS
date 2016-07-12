//
//  MovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class SentMoveTableViewCell: UITableViewCell {
    
}

class OpenMoveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
}

class FindMovesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setUpPullToRefresh(Color.primaryDark)
        tableView.delegate = self
        tableView.dataSource = self
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barTintColor = Color.primary
        navigationBar?.topItem?.title = "What your friends want to do"
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    deinit {
        self.tableView.dg_removePullToRefresh()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        // Custom header background color
        view.tintColor = Color.primary
        
        let headerText = view as! UITableViewHeaderFooterView
        headerText.textLabel?.textColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Your Open Moves"
        }
        
        return "Timeline"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier(
                "SentMoveTableViewCell", forIndexPath: indexPath)
            
            return cell
        }
        else if indexPath.section == 1 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier(
                "OpenMoveTableViewCell", forIndexPath: indexPath)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
