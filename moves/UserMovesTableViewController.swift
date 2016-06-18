//
//  UserMovesTableViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class PrivateMoveRequestTableViewCell: UITableViewCell {
    
}

class AcceptedPrivateMoveTableViewCell: UITableViewCell {
    
}

class UserMovesTableViewController: UITableViewController {
    private var privateMovesViewModel = PrivateMovesViewModel(privateMoveService: PrivateMoveService(restService: RestService(authenticationService: AuthenticationService())))
    private var disposeBag = DisposeBag()
    
    private var moves: Results<PrivateMoveModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.setUpPullToRefresh(Color.primaryDark)
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar?.barTintColor = Color.primary
        navigationBar?.topItem?.title = "My Moves"
        
        privateMovesViewModel.getPrivateMoves()
            .subscribeNext { (results) in
                self.moves = results
                self.tableView.reloadData()
            }.addDisposableTo(disposeBag)
        
        privateMovesViewModel.getPrivateMoves()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moves != nil {
            return moves!.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PrivateMoveTableViewCell", forIndexPath: indexPath) as! AcceptedPrivateMoveTableViewCell
  
        if moves != nil {
            let move = moves![indexPath.item] as? AcceptedPrivateMoveTableViewCell
            
            if move != nil {
                
            }
        }
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func openMessenger(sender: UIButton) {
        
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
}