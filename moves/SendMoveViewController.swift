//
//  SendMoveViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
}

class SendMoveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var sendMoveViewModel: SendMoveViewModel = SendMoveViewModel(moveService: MoveService(restService: RestService(authenticationService: AuthenticationService())), userService: UserService(restService: RestService(authenticationService: AuthenticationService()), authenticationService: AuthenticationService()))
    
    var moveMessage: String = ""
    var disposeBag = DisposeBag()
    var friends: Results<UserModel>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(false, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(false, pageViewController: horizontalPageController)
        
        tableView.delegate = self
        tableView.dataSource = self
   
        sendMoveViewModel.friends.subscribe(onNext: { (friends) in
            self.friends = friends
            self.tableView.reloadData()
        }).addDisposableTo(disposeBag)
        
        sendMoveViewModel.getFriends()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (friends != nil) {
            return friends!.count
        }
        
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =
            self.tableView.dequeueReusableCellWithIdentifier(
                "FriendTableCell", forIndexPath: indexPath)
                as? FriendTableViewCell
    
        let friend = friends![indexPath.item]
        
        cell!.nameLabel.text = friend.name
        cell!.usernameLabel.text = friend.username

        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendMove(sender: UIButton) {
        sendMoveViewModel.createMove(moveMessage, scope: "user")
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(true, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(true, pageViewController: horizontalPageController)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private func toggleScrollOnPageViewController(scrollEnabled: Bool, pageViewController: UIPageViewController) {
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.scrollEnabled = scrollEnabled
            }
        }
    }
}
