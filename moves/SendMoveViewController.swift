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
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
}

class SendMoveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var sendMoveViewModel: SendMoveViewModel = SendMoveViewModel(privateMoveService: PrivateMoveService(restService: RestService(authenticationService: AuthenticationService())), moveTimelineService: MoveTimelineService(restService: RestService(authenticationService: AuthenticationService())), friendService: FriendService(authenticationService: AuthenticationService(), restService: RestService(authenticationService: AuthenticationService())))
    
    var moveMessage: String = ""
    var disposeBag = DisposeBag()
    var friends: Results<UserModel>?
    
    @IBOutlet weak var tableView: UITableView!
    
    private var bestFriendImage: UIImage!
    private var friendImage: UIImage!
    private var recentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(false, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(false, pageViewController: horizontalPageController)
        
        bestFriendImage = UIImage(named: "ok")
        friendImage = UIImage(named: "sunglasses")
        recentImage = UIImage(named: "alarm")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        sendMoveViewModel.friends.subscribe(onNext: { (friends) in
            self.friends = friends
            self.tableView.reloadData()
        }).addDisposableTo(disposeBag)
        
        sendMoveViewModel.getFriends()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 && friends != nil {
            return friends!.count
        }
        else if section == 2 && friends != nil {
            return friends!.count
        }
        
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier(
                "TimelineCell", forIndexPath: indexPath)

            return cell
        }
        else if indexPath.section == 1 && friends != nil {
            let cell =
                self.tableView.dequeueReusableCellWithIdentifier(
                    "FriendTableViewCell", forIndexPath: indexPath)
                as? FriendTableViewCell
            
            let friend = friends![indexPath.item]
            
            cell!.nameLabel.text = friend.name
            cell!.usernameLabel.text = friend.username
            cell?.cellImage.image = bestFriendImage
            
            return cell!
        }
        else if indexPath.section == 2 && friends != nil {
            let cell =
                self.tableView.dequeueReusableCellWithIdentifier(
                    "FriendTableViewCell", forIndexPath: indexPath)
                    as? FriendTableViewCell
            
            let friend = friends![indexPath.item]
            
            cell!.nameLabel.text = friend.name
            cell!.usernameLabel.text = friend.username
            cell?.cellImage.image = recentImage
            
            return cell!
        }
        else if indexPath.section == 3 && friends != nil {
            let cell =
                self.tableView.dequeueReusableCellWithIdentifier(
                    "FriendTableViewCell", forIndexPath: indexPath)
                    as? FriendTableViewCell
            
            let friend = friends![indexPath.item]
            
            cell!.nameLabel.text = friend.name
            cell!.usernameLabel.text = friend.username
            cell?.cellImage.image = friendImage
            
            return cell!
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Everyone"
        }
        else if section == 1 {
            return "Your Bestfriends"
        }
        else if section == 2 {
            return "Your Recents"
        }
        
        return "Your Friends"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendMove(sender: UIButton) {
        sendMoveViewModel.createMove(moveMessage, scope: "user")
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        // Custom header background color
        view.tintColor = Color.primary
        
        let headerText = view as! UITableViewHeaderFooterView
        headerText.textLabel?.textColor = UIColor.whiteColor()
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
