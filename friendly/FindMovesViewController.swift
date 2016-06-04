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
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barTintColor = UIColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1)
        navigationBar?.topItem?.title = "What your friends want to do"
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
        setUpPullToRefresh(UIColor(red: 0.10, green: 0.46, blue: 0.82, alpha: 1))
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    private func setUpPullToRefresh(color: UIColor) {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.whiteColor()
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(color)
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    func refresh(sender:AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
