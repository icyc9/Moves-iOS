//
//  ProfileAndCreateMovesNavigationViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class ProfileAndCreateMovesNavigationViewController: BasePageViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.pages = [self.createPage("make_moves", storyboardName: "Main"),
                      self.createPage("profile", storyboardName: "Main")]
        
        self.showFirstPage()
    }

}
