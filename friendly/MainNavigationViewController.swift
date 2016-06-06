//
//  MainNavigationViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/2/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class MainNavigationViewController: BasePageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        dataSource = self
        
        self.pages = [self.createPage("find_moves"),
                      self.createPage("make_moves_profile_navigation"),
                      self.createPage("moves")]
        
        self.showLastPage()
    }
}
