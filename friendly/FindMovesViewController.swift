//
//  MovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class FindMovesViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        let friendsController = storyboard!.instantiateViewControllerWithIdentifier("friends_moves")
        friendsController.title = "Friends"
        
        let areaController = storyboard!.instantiateViewControllerWithIdentifier("area_moves")
        areaController.title = "Area"
        
        controllerArray.append(friendsController);
        controllerArray.append(areaController)
        
        let primaryBlue = UIColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1);
        
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.1),
            .ScrollMenuBackgroundColor(primaryBlue),
            .SelectionIndicatorColor(UIColor(red: 1, green: 0.25, blue: 0.50, alpha: 1)),
            .MenuItemSeparatorColor(primaryBlue)
        ]
        
        let navheight = (navigationController?.navigationBar.frame.size.height ?? 0) + UIApplication.sharedApplication().statusBarFrame.size.height
        
        let frame = CGRectMake(0, navheight, view.frame.width, view.frame.height-navheight)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: frame, pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
