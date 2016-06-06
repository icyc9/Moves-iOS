//
//  IntroPagesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class IntroPagesViewController: BasePageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.pages = [self.createPage("sign_up"),
                 self.createPage("intro_1"),
                 self.createPage("intro_2"),
                 self.createPage("intro_3")]
    }
}
