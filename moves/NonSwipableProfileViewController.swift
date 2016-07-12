//
//  NonSwipableProfileViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class NonSwipableProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        toggleScrollOnPageViewController(false, horizontalScrollEnabled: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goBack(sender: UIBarButtonItem) {
        toggleScrollOnPageViewController(true, horizontalScrollEnabled:true)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func toggleScrollOnPageViewController(verticalScrollEnabled: Bool, horizontalScrollEnabled: Bool) {
        
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController

        for view in verticalPageController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.scrollEnabled = verticalScrollEnabled
            }
        }
        
        for view in horizontalPageController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.scrollEnabled = horizontalScrollEnabled
            }
        }
    }
}